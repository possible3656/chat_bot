import 'package:chat_bot/app/modules/MarketPage/controllers/market_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as chart;

class ChartViewRil extends GetView<MarketPageController> {
  const ChartViewRil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              width: controller.returnWidth(),
              child: chart.BarChart(
                controller.returnBarList(controller.selectedButton.value),
                behaviors: [
                  chart.SlidingViewport(
                    chart.SelectionModelType.action,
                  ),
                  chart.PanBehavior(),
                ],
              )),
        ));
  }
}
