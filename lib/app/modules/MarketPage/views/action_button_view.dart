import 'package:chat_bot/app/data/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../data/Constant.dart';
import '../controllers/market_page_controller.dart';

class ActionButtonView extends GetView<MarketPageController> {
  String buttonName;
  int no;
  ActionButtonView(this.buttonName, this.no, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => controller.onButtonPressed(no),
        child: Obx(() => Container(
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
                  color: controller.selectedButton.value == no
                      ? Constant.darkBlue
                      : Constant.background),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text(
                  buttonName,
                  style: TextStyle(color: Constant.textColor),
                ),
              ),
            )),
      ),
    );
  }
}
