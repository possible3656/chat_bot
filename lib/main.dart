import 'package:chat_bot/app/data/Constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Chat Bot",
      theme:
          ThemeData(fontFamily: 'poppins', primaryColor: Constant.background),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
