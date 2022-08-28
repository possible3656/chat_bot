import 'dart:convert';

import 'package:charts_flutter/flutter.dart';
import 'package:chat_bot/app/modules/MarketPage/views/botomsheet_button_view.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MarketPageController extends GetxController {
  RxBool loading = true.obs;
  Rx<GlobalKey<State<StatefulWidget>>> key = GlobalKey().obs;

  Uri url = Uri.parse(
      'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=RELIANCE.BSE&outputsize=full&apikey=demo');

  Map data = {}.obs;
  RxInt len = 0.obs;
  RxInt year = 2022.obs;
  RxInt month = 8.obs;
  RxString selectedTime = 'Aug 2022'.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        data = jsonDecode(response.body)['Time Series (Daily)'];
      } else {}
      loading.value = false;
    } catch (e) {
      print(e);
    }
  }

  RxInt selectedButton = 0.obs;

  onButtonPressed(int no) {
    if (selectedButton.value != no) {
      selectedButton.value = no;
    }
  }

  List<Series<dynamic, String>> returnBarList(int number) {
    List<ChartModel> map = [];
    String month = '';
    String year = '';

    for (var i = 0; i < data.keys.length; i++) {
      if (number == 0) {
        if (DateTime.parse((data.keys.elementAt(i))).year == this.year.value) {
          if (DateTime.parse((data.keys.elementAt(i))).month ==
              this.month.value) {
            String date =
                DateTime.parse((data.keys.elementAt(i))).day.toString();

            double vol =
                int.parse(data[data.keys.elementAt(i)]['6. volume']) / 100000;

            map.add(ChartModel(date, vol));
          }
        }
      } else if (number == 1) {
        if (DateTime.parse((data.keys.elementAt(i))).year == this.year.value) {
          if (DateTime.parse((data.keys.elementAt(i))).weekday == 1) {
            String date =
                DateTime.parse((data.keys.elementAt(i))).day.toString();

            double vol =
                int.parse(data[data.keys.elementAt(i)]['6. volume']) / 100000;

            map.add(ChartModel(date, vol));
          }
        }
      } else if (number == 2) {
        if ((DateTime.parse((data.keys.elementAt(i))).year ==
            this.year.value)) {
          if (month !=
              DateTime.parse((data.keys.elementAt(i))).month.toString()) {
            month = data.keys.elementAt(i).toString().substring(5, 7);
            print(month);
            double vol =
                int.parse(data[data.keys.elementAt(i)]['6. volume']) / 100000;

            map.add(ChartModel(months[int.parse(month) - 1], vol));
          }
        }
      } else if (selectedButton.value == 3) {
        if (year != data.keys.elementAt(i).toString().substring(2, 4)) {
          year = data.keys.elementAt(i).toString().substring(2, 4);
          double vol =
              int.parse(data[data.keys.elementAt(i)]['6. volume']) / 100000;
          if (map.length < 7) map.add(ChartModel(year, vol));
        }
      } else {
        if (year != data.keys.elementAt(i).toString().substring(2, 4)) {
          year = data.keys.elementAt(i).toString().substring(2, 4);
          double vol =
              int.parse(data[data.keys.elementAt(i)]['6. volume']) / 100000;
          map.add(ChartModel(year, vol));
        }
      }
    }
    len.value = map.length;
    return [
      Series<ChartModel, String>(
        id: 'charts',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (ChartModel chart, _) => chart.day,
        measureFn: (ChartModel chart, _) => chart.volume,
        data: map,
      )
    ];
  }

  returnWidth() {
    if (selectedButton.value == 0) {
      return 1.5 * 20 * returnBarList(selectedButton.value)[0].data.length;
    } else if (selectedButton.value == 2) {
      return 1.5 * 1.5 * returnBarList(selectedButton.value)[0].data.length;
    } else if (selectedButton.value == 3) {
      return 1.5 * 30 * returnBarList(selectedButton.value)[0].data.length;
    } else {
      return 1.5 * 20 * returnBarList(selectedButton.value)[0].data.length;
    }
  }

  void onBackPressed() {
    Get.back();
  }

  List months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];
  returnBottomSheetButtons(bool bool) {
    String month = '';
    String year = '';
    List<BottomSheetView> bsView = [];

    for (var i = 0; i < data.keys.length; i++) {
      if (bool) {
        if (year != DateTime.parse((data.keys.elementAt(i))).year.toString()) {
          year = DateTime.parse((data.keys.elementAt(i))).year.toString();
          bsView.add(BottomSheetView(int.parse(year), year, bool));
        }
      } else {
        if ((DateTime.parse((data.keys.elementAt(i))).year ==
            this.year.value)) {
          if (month !=
              DateTime.parse((data.keys.elementAt(i))).month.toString()) {
            // print(data.keys.elementAt(i).toString());
            month = DateTime.parse((data.keys.elementAt(i))).month.toString();

            bsView.add(BottomSheetView(
                int.parse(month), months[int.parse(month) - 1], bool));
          }
        }
      }
    }
    return bsView;
  }

  void bottomSheetButtonPressed(int m, bool b) {
    if (b) {
      year.value = m;
      selectedTime.value =
          months[month.value - 1] + ' ' + year.value.toString();
      returnBarList(selectedButton.value);
    } else {
      print('pressed $m');
      month.value = m;
      selectedTime.value =
          months[month.value - 1] + ' ' + year.value.toString();
      print(selectedTime.value);
      returnBarList(selectedButton.value);
    }
  }
}

class ChartModel {
  final String day;
  final double volume;

  ChartModel(this.day, this.volume);
}
