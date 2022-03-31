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
  final pageController = PageController();
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

  void goToFirstPage() {
    pageController.jumpToPage(0);
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
