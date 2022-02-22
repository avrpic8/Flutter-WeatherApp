import 'package:flutter_weather/app/data/models/currentCall/weather_data.dart';
import 'package:flutter_weather/app/data/service/http_service.dart';
import 'package:get/get.dart';

class CurrentWaetherApiProvider {
  final httpService = Get.find<HttpSerrvice>();

  Future<WeatherData> getWeatherByCoord(
      {required String lat, required String lon}) async {
    var data =
        await httpService.getCurrentWeatherByCoordinate(lat: lat, lon: lon);
    return data;
  }
}
