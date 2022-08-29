import 'dart:convert';

import 'package:chat_bot/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxString speechText = ''.obs;
  RxBool listening = false.obs;
  final Rx<SpeechToText> _speechToText = SpeechToText().obs;
  final RxBool _speechEnabled = false.obs;
  RxBool searchingForReply = false.obs;
  RxBool keyboardOn = false.obs;
  final Rx<ScrollController> scrollController = ScrollController().obs;
  List questionAnswersList = [].obs;
  RxString message = ''.obs;
  var messageController = TextEditingController().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _speechEnabled.value = await _speechToText.value.initialize();
  }

  goToEnd() {
    scrollController.value.animateTo(
        scrollController.value.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut);
  }

  micButtonPressed() async {
    if (listening.value) {
      listening.value = false;
      _stopListening();
    } else {
      listening.value = true;
      speechText.value = '';
      await _speechToText.value.listen(
        onResult: (SpeechRecognitionResult result) {
          speechText.value = result.recognizedWords;
          listening.value = _speechToText.value.isListening;
          if (result.finalResult) {
            getReply(speechText.value);
          }
        },
      );
    }
  }

  void _stopListening() async {
    await _speechToText.value.stop();
  }

  Future<void> getReply(String value) async {
    searchingForReply.value = true;
    questionAnswersList.add(value);
    speechText.value = '';
    WidgetsBinding.instance.addPostFrameCallback((_) => goToEnd());
    Uri url = Uri.parse(
        'https://aeona3.p.rapidapi.com/?text=${value.replaceAll(' ', '%20')}');

    Map<String, String> header = {
      // "content-type": "application/json",
      "X-RapidAPI-Key": "replace with your own api key",
      "X-RapidAPI-Host": "aeona3.p.rapidapi.com"
    };
    try {
      http.Response response = await http.get(
        url,
        headers: header,
      );

      searchingForReply.value = false;
      questionAnswersList.add(response.statusCode == 200
          ? response.body
          : 'Sorry Something went wrong');
      WidgetsBinding.instance.addPostFrameCallback((_) => goToEnd());
    } catch (e) {
      questionAnswersList.add('Sorry Something went wrong');
      WidgetsBinding.instance.addPostFrameCallback((_) => goToEnd());

      searchingForReply.value = false;
    }
  }

  keyboardButtonPressed() {
    keyboardOn.value = true;
  }

  void onMessageChanged(String value) {
    message.value = value;
  }

  messageButtonPressed() {
    if (message.value.isEmpty) {
      keyboardOn.value = false;
    } else {
      onSubmit(message.value);
    }
  }

  void onSubmit(String value) {
    messageController.value.text = '';
    message.value = '';
    getReply(value);
  }

  chartPage() {
    Get.toNamed(Routes.MARKET_PAGE);
  }
}
