import 'package:flutter_weather/app/data/models/geocoding/direct_geocoding.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';

abstract class Repository {

  Future<WeatherData> getWeatherByCoordinate({
    required Function(dynamic erro) onError,
    required String lat,
    required String lon,
  });

  Future<WeatherData> getCurrentWeatherByCoordinate({
    required Function(dynamic erro) onError,
    required String lat,
    required String lon,
  });

  Future<WeatherData> getDailyWeatherByCoordinate({
    required Function(dynamic erro) onError,
    required String lat,
    required String lon,
  });

  Future<DirectGeocoding> getCoordinateByCityName({
    required Function(dynamic erro) onError,
    required String cityName
  });

  Future<DirectGeocoding> getCityNameByCoordinate({
    required Function(dynamic erro) onError,
    required String lat,
    required String lon,
  });
}
