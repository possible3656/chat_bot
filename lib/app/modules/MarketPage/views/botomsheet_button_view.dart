import 'package:chat_bot/app/modules/MarketPage/controllers/market_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../data/Constant.dart';

class BottomSheetView extends GetView<MarketPageController> {
  final int month;
  final String monthName;
  final bool year;
  const BottomSheetView(this.month, this.monthName, this.year, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
          onTap: () {
            print('presed');
            controller.bottomSheetButtonPressed(month, year);
          },
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      offset: const Offset(-6.0, -6.0),
                      blurRadius: 10.0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: const Offset(6.0, 6.0),
                      blurRadius: 10.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25),
                  color: retunrbgColor()),
              child: Padding(
                padding: year
                    ? EdgeInsets.fromLTRB(15, 7, 15, 7)
                    : EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  monthName,
                  style: TextStyle(
                      color: Constant.textColor,
                      fontSize: 12,
                      letterSpacing: 1.1),
                ),
              ),
            ),
          )),
    );
  }

  retunrbgColor() {
    if (year) {
      return controller.year.value == month
          ? Constant.textColor.withOpacity(.5)
          : Constant.background;
    } else {
      return controller.month.value == month
          ? Constant.textColor.withOpacity(.5)
          : Constant.background;
    }
  }
}
