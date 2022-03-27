import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/modules/connection/connection_controller.dart';
import 'package:flutter_weather/app/modules/main/main_controller.dart';
import 'package:get/get.dart';

class CurrentWeatherController extends GetxController {
  final mainCtr = Get.find<MainController>();
  final connectionCtr = Get.find<ConnectionController>();

  void updateCurrentWeather({required MainWeather weather}) async {
    if (connectionCtr.connectionState != noneInternet) {
      var lat = weather.weatherData.lat;
      var lon = weather.weatherData.lon;
      int oldIndex = mainCtr.weatherList.indexOf(weather);
      var updatedWeather = await mainCtr.getWeatherByCoordinate(
          lat: lat.toString(), lon: lon.toString());
      weather.weatherData = updatedWeather;
      mainCtr.createOrUpdateWeather(weather);
      mainCtr.weatherList[oldIndex] = weather;
    }
  }
}
