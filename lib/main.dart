import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_weather/app/data/service/http_service.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  Get.put(HttpSerrvice());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
