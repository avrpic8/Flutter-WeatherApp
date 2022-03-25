import 'package:flutter_weather/app/data/models/app_settings.dart';
import 'package:flutter_weather/app/data/models/geocoding/direct_geocoding.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
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

  Future<DirectGeocoding> getCoordinateByCityName(
      {required Function(dynamic erro) onError, required String cityName});

  Future<DirectGeocoding> getCityNameByCoordinate({
    required Function(dynamic erro) onError,
    required String lat,
    required String lon,
  });

  Future<MainWeather> createOrUpdateWeather(MainWeather data);

  Future<List<MainWeather>> getAllWeather();

  Future<void> deleteAllWeather();

  Future<void> writeSetting(AppSettings data);

  Future<AppSettings?> readSetting();

  Future<void> clear();
}
