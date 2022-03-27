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
      checkUpdateTime(Get.context, weatherList);
    }
  }

  RxInt get selectedPageIndex => _selectedWeatherPageIndex;

  void checkUpdateTime(
      BuildContext? context, List<MainWeather> weatherList) async {
    if (settingCtr.autoUpdateTime != disable) {
      final snackBar = SnackBar(
        content: Text(
          'Weather data is updating...',
          style: normalTextTheme.copyWith(color: Colors.white),
        ),
      );
      ScaffoldMessenger.of(context!).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      int index = 0;
      for (var item in weatherList) {
        ++index;
        var deltaTime = (item.weatherData.current?.dt)!.getDeltaTimeEpoch();
        if (deltaTime > settingCtr.autoUpdateTime) {
          MainWeather weather =
              await mainCtr.getWeatherByCityName(cityName: item.cityName!);
          weatherList.remove(item);
          weatherList.insert(index, weather);
        }
      }
      mainCtr.weatherList.assignAll(weatherList);
      mainCtr.refreshDataBase();
    }
  }
}
