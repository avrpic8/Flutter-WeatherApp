import 'package:get/get.dart';

/// Get approximate system navigation bar height
double getSystemNavigationHeight() {
  return Get.statusBarHeight - 10;
}

String getWeatherConditions(int id) {
  String assetsPath = '';
  if (id < 600) {
    assetsPath = 'assets/images/background/rainy.jpg';
  }
  if (id < 700) {
    assetsPath = 'assets/images/background/snow.jpg';
  }

  return assetsPath;
}
