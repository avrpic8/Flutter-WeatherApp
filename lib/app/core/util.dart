import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/core/keys.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/modules/main/main_controller.dart';
import 'package:flutter_weather/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// Get approximate system navigation bar height
double getSystemNavigationHeight() {
  return Get.bottomBarHeight;
}

double getSumOfAppBarAndStatusBarHeight() {
  return Get.statusBarHeight + AppBar().preferredSize.height - 20;
}

/// Change status bar color for every screen
void goToPage(
    {required String path,
    Color nextStatusScreenColor = Colors.transparent,
    Color previousStatusScreenColor = Colors.transparent}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
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

  String unixToDay() {
    var timestampMilliSec = this * 1000; // to milli sec
    var date = DateTime.fromMillisecondsSinceEpoch(timestampMilliSec.toInt());
    final DateFormat formatter = DateFormat('EEEE');
    return formatter.format(date);
  }

  int getDeltaTimeEpoch() {
    var updatedTime = this * 1000; // to milli sec
    var updatedDate = DateTime.fromMillisecondsSinceEpoch(updatedTime.toInt());
    var deltaTime = DateTime.parse(updatedDate.toString())
        .difference(DateTime.now())
        .inHours
        .abs();
    print(deltaTime);
    return deltaTime;
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

/// Color extention
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

String getWeatherBackgrounds(int id) {
  String assetsPath = '';
  if (id >= 200 && id <= 232) {
    assetsPath = '';
    return assetsPath;
  } else if (id >= 500 && id <= 531) {
    assetsPath = 'assets/images/background/rainy.jpg';
    return assetsPath;
  } else if (id >= 600 && id <= 622) {
    assetsPath = 'assets/images/background/snow.jpg';
    return assetsPath;
  } else if (id >= 701 && id <= 781) {
    assetsPath = '';
    return assetsPath;
  } else if (id == 800) {
    assetsPath = 'assets/images/background/sunny.jpg';
    return assetsPath;
  } else {
    assetsPath = '';
    return assetsPath;
  }
}

String getWeatherIcons(int id) {
  String assetsPath = '';
  if (id >= 200 && id <= 232) {
    assetsPath = 'assets/images/weatherSvg/thunder.svg';
    return assetsPath;
  } else if (id >= 300 && id <= 321) {
    assetsPath = 'assets/images/weatherSvg/showerRain.svg';
    return assetsPath;
  } else if (id >= 500 && id <= 531) {
    assetsPath = 'assets/images/weatherSvg/rain2.svg';
    return assetsPath;
  } else if (id >= 600 && id <= 622) {
    assetsPath = 'assets/images/weatherSvg/snow.svg';
    return assetsPath;
  } else if (id >= 701 && id <= 781) {
    assetsPath = 'assets/images/weatherSvg/mist.svg';
    return assetsPath;
  } else if (id == 800) {
    assetsPath = 'assets/images/weatherSvg/clearSky.svg';
    return assetsPath;
  } else if (id == 801) {
    assetsPath = 'assets/images/weatherSvg/fewCloude.svg';
    return assetsPath;
  } else if (id == 802) {
    assetsPath = 'assets/images/weatherSvg/scatteredCloude.svg';
    return assetsPath;
  } else if (id == 803) {
    assetsPath = 'assets/images/weatherSvg/brokenCloud.svg';
    return assetsPath;
  } else {
    assetsPath = 'assets/images/weatherSvg/brokenCloud.svg';
    return assetsPath;
  }
}

/// Create a notification
Future<void> createWeatherNotificaion(MainWeather weather) async {
  var weatherId = weather.weatherData.current!.weather![0].id;
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 4,
        channelKey: 'basic channel',
        title:
            '${weather.cityName} ${weather.weatherData.current!.temp!.kelvinToCelsius()}\u2103',
        body: weather.weatherData.current!.weather![0].description,
        bigPicture: 'asset://${getWeatherBackgrounds(weatherId!)}',
        notificationLayout: NotificationLayout.Default),
  );
}

void shouldShowNotification(
    {required SettingsController settingController,
    required MainController mainController}) {
  if (settingController.notificationFlag) {
    var list = mainController.weatherList;
    createWeatherNotificaion(list[0]);
  }
}

/// Show a native toast on android
Future<void> showToast(String message) async {
  try {
    final String result =
        await platform.invokeMethod(nativeToastKey, {'message': message});
    print(result);
  } on PlatformException catch (e) {
    print(e.toString());
  }
}
