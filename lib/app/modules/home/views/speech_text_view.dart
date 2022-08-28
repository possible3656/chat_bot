import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../data/Constant.dart';
import '../controllers/home_controller.dart';

class SpeechText extends GetView<HomeController> {
  const SpeechText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Obx(() => Padding(
            padding:
                const EdgeInsets.only(bottom: 20, top: 20, right: 20, left: 20),
            child: Text(
              controller.speechText.value,
              style: TextStyle(
                  fontSize: 18,
                  color: controller.listening.value
                      ? Constant.textColor.withOpacity(.3)
                      : Constant.textColor),
            ),
          )),
    );
  }
}
