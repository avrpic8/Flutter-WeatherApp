import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/core/theme.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/core/util.dart';
import 'package:flutter_weather/app/modules/main/main_controller.dart';
import 'package:flutter_weather/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _selectedWeatherPageIndex = 0.obs;
  final settingCtr = Get.find<SettingsController>();
  final mainCtr = Get.find<MainController>();

  @override
  void onInit() async {
    super.onInit();
    List<MainWeather> weatherList = await mainCtr.getAllWeather();
    if (weatherList.isNotEmpty) {
      mainCtr.weatherList.assignAll(weatherList);
      autoUpdate(Get.context, weatherList);
    }

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: 'Simple Notification',
          body: 'Simple body'),
    );
  }

  RxInt get selectedPageIndex => _selectedWeatherPageIndex;

  void autoUpdate(BuildContext? context, List<MainWeather> weatherList) async {
    bool allowShowing = true;
    if (settingCtr.autoUpdateTime != disable) {
      final snackBar = SnackBar(
        content: Text(
          'Weather data is updating...',
          style: normalTextTheme.copyWith(color: Colors.white),
        ),
      );
      int index = 0;
      for (var item in weatherList) {
        var deltaTime = (item.weatherData.current?.dt)!.getDeltaTimeEpoch();
        if (deltaTime > settingCtr.autoUpdateTime) {
          if (allowShowing) {
            ScaffoldMessenger.of(context!).showSnackBar(snackBar);
            allowShowing = false;
          }
          MainWeather weather =
              await mainCtr.getWeatherByCityName(cityName: item.cityName!);
          weatherList[index] = weather;
        }
        index++;
      }
      mainCtr.weatherList.assignAll(weatherList);
      mainCtr.refreshDataBase();
    }
  }
}
