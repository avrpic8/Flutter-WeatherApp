import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:flutter_weather/app/data/service/http_service.dart';

class WaetherApiProvider {
  final HttpSerrvice httpSerrvice;

  WaetherApiProvider({required this.httpSerrvice});

  Future<WeatherData> getCurrentWeatherByCoordinate(
      {required String lat, required String lon}) async {
    var data =
        await httpSerrvice.getCurrentWeatherByCoordinate(lat: lat, lon: lon);
    return data;
  }

  Future<WeatherData> getDailyWeatherByCoordinate(
      {required String lat, required String lon}) async {
    var data =
        await httpSerrvice.getDailyWeatherByCoordinate(lat: lat, lon: lon);
    return data;
  }
}
