import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../../../data/Constant.dart';
import '../controllers/market_page_controller.dart';

class BackButtonView extends GetView<MarketPageController> {
  const BackButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          controller.onBackPressed();
        },
        child: Container(
          decoration: Constant.containerDecoration(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                LineIcon(
                  LineIcons.arrowLeft,
                  color: Constant.textColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Back',
                  style: TextStyle(color: Constant.textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
