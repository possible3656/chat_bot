import 'package:chat_bot/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/Constant.dart';

class ChatViewView extends GetView<HomeController> {
  const ChatViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: controller.questionAnswersList.isEmpty
            ? Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/robot1.png'),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Text(
                        'Hey, I\'m Your Personal Assistant.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constant.textColor,
                            fontSize: 18,
                            letterSpacing: 1.1),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 05),
                      child: Text(
                        'Ask me anthing by pressing button below.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constant.textColor.withOpacity(.5),
                            fontSize: 12,
                            letterSpacing: 1.1),
                      ),
                    )
                  ],
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                controller: controller.scrollController.value,
                itemCount: controller.questionAnswersList.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Align(
                      alignment: index % 2 == 0
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Padding(
                        padding: index % 2 == 0
                            ? const EdgeInsets.only(
                                left: 50,
                              )
                            : const EdgeInsets.only(
                                right: 50,
                              ),
                        child: Container(
                          decoration: Constant.containerDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Text(
                              controller.questionAnswersList[index],
                              style: TextStyle(color: Constant.textColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
