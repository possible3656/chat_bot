import 'package:chat_bot/app/data/Constant.dart';
import 'package:chat_bot/app/modules/MarketPage/views/action_button_view.dart';
import 'package:chat_bot/app/modules/MarketPage/views/back_button_view.dart';
import 'package:chat_bot/app/modules/MarketPage/views/botomsheet_button_view.dart';
import 'package:chat_bot/app/modules/MarketPage/views/chart_view.dart';
import 'package:chat_bot/app/modules/MarketPage/views/info_bar_view.dart';
import 'package:chat_bot/app/modules/MarketPage/views/persistentHeaderView.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../controllers/market_page_controller.dart';
import '';

class MarketPageView extends GetView<MarketPageController> {
  const MarketPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constant.background,
        body: Obx(() => Center(
              child: controller.loading.value
                  ? LoadingAnimationWidget.fourRotatingDots(
                      color: Constant.textColor, size: 26)
                  : SafeArea(
                      child: ExpandableBottomSheet(
                      key: controller.key.value,
                      background: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BackButtonView(),
                          const InfoBarView(),
                          const ChartViewRil(),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  ActionButtonView('D', 0),
                                  ActionButtonView('W', 1),
                                  ActionButtonView('M', 2),
                                  ActionButtonView('Y', 3),
                                  ActionButtonView('M', 4),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      persistentHeader: const PersistenceHeaderView(),
                      expandableContent: Container(
                        width: double.infinity,
                        color: Constant.background2,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: Row(
                                  children: [
                                    Text(
                                      'Years',
                                      style:
                                          TextStyle(color: Constant.textColor),
                                    )
                                  ],
                                ),
                              ),
                              Wrap(
                                alignment: WrapAlignment.center,
                                children:
                                    controller.returnBottomSheetButtons(true),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: Row(
                                  children: [
                                    Text(
                                      'Months',
                                      style:
                                          TextStyle(color: Constant.textColor),
                                    )
                                  ],
                                ),
                              ),
                              Wrap(
                                alignment: WrapAlignment.spaceEvenly,
                                children:
                                    controller.returnBottomSheetButtons(false),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
            )));
  }
}
