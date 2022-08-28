import 'package:chat_bot/app/modules/MarketPage/controllers/market_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../../../data/Constant.dart';

class PersistenceHeaderView extends GetView<MarketPageController> {
  const PersistenceHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          child: Container(
            height: MediaQuery.of(context).size.height * .1,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Constant.background2),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selected Time',
                        style: TextStyle(
                            color: Constant.textColor.withOpacity(.5),
                            letterSpacing: 1.1,
                            fontSize: 12),
                      ),
                      Row(
                        children: [
                          Text(
                            controller.selectedTime.value,
                            style: TextStyle(
                                color: Constant.textColor,
                                letterSpacing: 1.1,
                                fontSize: 16),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          LineIcon(
                            LineIcons.pen,
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      ),
                    ],
                  ),
                  LineIcon(
                    LineIcons.angleUp,
                    color: Colors.white,
                    size: 26,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
