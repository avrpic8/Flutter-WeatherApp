import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// Get approximate system navigation bar height
double getSystemNavigationHeight() {
  return Get.bottomBarHeight;
}

/// Change status bar color for every screen
void goToPage(
    {required String path,
    Color nextStatusScreenColor = Colors.transparent,
    Color previousStatusScreenColor = Colors.transparent}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: nextStatusScreenColor));
  Get.toNamed(path)!.then(
    (_) => SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: previousStatusScreenColor)),
  );
}

/// Temprature converter extentions
extension TempratureParsing on double {
  String kelvinToCelsius() {
    var result = (this - 273.15).toStringAsFixed(0);
    return result;
  }

  String kelvinToFahrenheit() {
    var result = ((this - 273.15) * 1.8) + 32;
    return result.toStringAsFixed(0);
  }
}

/// Date converter extentions
extension DateParsing on int {
  String unixToDate() {
    var timestampMilliSec = this * 1000; // to milli sec
    var date = DateTime.fromMillisecondsSinceEpoch(timestampMilliSec.toInt());
    final DateFormat formatter = DateFormat('hh:mm  a--  E,  d MMMM yyyy');
    return formatter.format(date);
  }
}

/// Conver m/s to miles/h
extension SpeedParsing on double {
  String toMilesPerHour() {
    var result = this * 2.237;
    return result.toStringAsFixed(1);
  }
}

extension StringExtension on String? {
  String capitalize() {
    return "${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}";
  }
}

String getWeatherConditions(int id) {
  String assetsPath = '';
  if (id < 600) {
    assetsPath = 'assets/images/background/rainy.jpg';
    return assetsPath;
  } else if (id < 700) {
    assetsPath = 'assets/images/background/snow.jpg';
    return assetsPath;
  } else if (id == 800) {
    assetsPath = 'assets/images/background/sunny.jpg';
    return assetsPath;
  } else {
    assetsPath = 'assets/images/background/rainy.jpg';
    return assetsPath;
  }
}
