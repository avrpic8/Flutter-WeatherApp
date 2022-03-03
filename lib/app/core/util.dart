import 'package:get/get.dart';

/// Get approximate system navigation bar height
double getSystemNavigationHeight() {
  return Get.statusBarHeight - 10;
}

String getWeatherConditions(int id) {
  String assetsPath = '';
  if (id < 600) {
    assetsPath = 'assets/images/background/rainy.jpg';
    return assetsPath;
  }
  else if (id < 700) {
    assetsPath = 'assets/images/background/snow.jpg';
    return assetsPath;
  }else{
    assetsPath = 'assets/images/background/sunny.jpg';
    return assetsPath;  
  }

  
}
