import 'package:flutter_weather/app/data/models/currentCall/weather_data.dart';
import 'package:flutter_weather/app/data/provider/current_weather_api_provider.dart';

class Repository {
  final CurrentWaetherApiProvider provider;

  Repository({required this.provider});

  Future<WeatherData> getWeatherByCoordinate(
      {required String lat, required String lon}) async {
    var data = await provider.getWeatherByCoord(lat: lat, lon: lon);
    return data;
  }
}