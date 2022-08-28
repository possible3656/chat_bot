import 'package:chat_bot/app/data/Constant.dart';
import 'package:chat_bot/app/modules/home/views/action_button_view.dart';
import 'package:chat_bot/app/modules/home/views/chat_view_view.dart';
import 'package:chat_bot/app/modules/home/views/speech_text_view.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [ChatViewView(), SpeechText(), ActionButtonView()],
      ),
    );
  }
}
