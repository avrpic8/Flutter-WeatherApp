import 'package:flutter_weather/app/core/constants.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/modules/connection/connection_controller.dart';
import 'package:flutter_weather/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class CurrentWeatherController extends GetxController {
  final homeCtr = Get.find<HomeController>();
  final connectionCtr = Get.find<ConnectionController>();

  void updateCurrentWeather({required MainWeather weather}) async {
    if (connectionCtr.connectionState != noneInternet) {
      var lat = weather.weatherData.lat;
      var lon = weather.weatherData.lon;
      int oldIndex = homeCtr.weatherList.indexOf(weather);
      var updatedWeather = await homeCtr.getWeatherByCoordinate(
          lat: lat.toString(), lon: lon.toString());
      homeCtr.weatherList[oldIndex] =
          MainWeather(weatherData: updatedWeather, cityName: weather.cityName);
    }
  }
}
