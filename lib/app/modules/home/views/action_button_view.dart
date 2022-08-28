import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../data/Constant.dart';
import '../controllers/home_controller.dart';

class ActionButtonView extends GetView<HomeController> {
  const ActionButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.keyboardOn.value
        ? Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: Constant.containerDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      maxLines: 1,
                      controller: controller.messageController.value,
                      style: TextStyle(color: Constant.textColor),
                      cursorColor: Constant.textColor,
                      decoration: InputDecoration(
                        hintText: 'Enter your message here',
                        hintStyle: TextStyle(
                            color: Constant.textColor.withOpacity(.5)),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        controller.onMessageChanged(value);
                      },
                      onSubmitted: (value) {
                        controller.onSubmit(value);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () => controller.messageButtonPressed(),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: controller.searchingForReply.value
                          ? LoadingAnimationWidget.fourRotatingDots(
                              color: Constant.textColor, size: 26)
                          : LineIcon(
                              controller.message.value.isNotEmpty
                                  ? LineIcons.paperPlane
                                  : LineIcons.microphone,
                              color: Constant.textColor,
                              size: 28,
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Container(
              height: 60,
              width: 220,
              decoration: Constant.containerDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => controller.keyboardButtonPressed(),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: LineIcon(
                        LineIcons.keyboard,
                        color: Constant.textColor,
                        size: 28,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.micButtonPressed(),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: controller.searchingForReply.value
                          ? LoadingAnimationWidget.fourRotatingDots(
                              color: Constant.textColor, size: 26)
                          : controller.listening.value
                              ? LoadingAnimationWidget.waveDots(
                                  color: Constant.textColor, size: 26)
                              : LineIcon(
                                  LineIcons.microphone,
                                  color: Constant.textColor,
                                  size: 28,
                                ),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.chartPage(),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: LineIcon(
                        Icons.auto_graph,
                        color: Constant.textColor,
                        size: 28,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
  }
}
