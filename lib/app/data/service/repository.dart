import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:flutter_weather/app/data/provider/weather_api_provider.dart';

class Repository {
  final WaetherApiProvider provider;

  Repository({required this.provider});

  Future<WeatherData> getWeatherByCoordinate(
      {required String lat, required String lon}) async {
    var data = await provider.getWeatherByCoord(lat: lat, lon: lon);
    return data;
  }

  Future<WeatherData> getDailyWeatherByCoordinate(
      {required String lat, required String lon}) async {
    var data = await provider.getDailyWeatherByCoord(lat: lat, lon: lon);
    return data;
  }
}
