import 'package:flutter_weather/app/core/keys.dart';
import 'package:flutter_weather/app/data/models/app_settings.dart';
import 'package:flutter_weather/app/data/models/geocoding/direct_geocoding.dart';
import 'package:flutter_weather/app/data/models/main_weather.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:flutter_weather/app/data/service/http_service.dart';
import 'package:flutter_weather/app/data/service/local_service.dart';
import 'package:flutter_weather/app/data/service/repository.dart';

class RepositoryImp implements Repository {
  final HttpService remoteService;
  final LocalService localService;

  RepositoryImp({required this.localService, required this.remoteService});

  @override
  Future<WeatherData> getWeatherByCoordinate(
      {required Function(dynamic erro) onError,
      required String lat,
      required String lon}) async {
    Map<String, dynamic> query = {
      'lat': lat,
      'lon': lon,
      'exclude': '',
      'appid': apiKey
    };
    WeatherData weatherData = await remoteService.getWeatherByCoordinate(
        onError: (e) => onError(e), query: query);
    return weatherData;
  }

  @override
  Future<WeatherData> getCurrentWeatherByCoordinate({
    required Function(dynamic erro) onError,
    required String lat,
    required String lon,
  }) async {
    Map<String, dynamic> query = {
      'lat': lat,
      'lon': lon,
      'exclude': 'minutely,hourly,daily',
      'appid': apiKey
    };
    WeatherData weatherData = await remoteService.getWeatherByCoordinate(
        onError: (e) => onError(e), query: query);
    return weatherData;
  }

  @override
  Future<WeatherData> getDailyWeatherByCoordinate({
    required Function(dynamic erro) onError,
    required String lat,
    required String lon,
  }) async {
    Map<String, dynamic> query = {
      'lat': lat,
      'lon': lon,
      'exclude': 'minutely,hourly,current',
      'appid': apiKey
    };
    WeatherData weatherData = await remoteService.getWeatherByCoordinate(
        onError: (e) => onError(e), query: query);
    return weatherData;
  }

  @override
  Future<DirectGeocoding> getCoordinateByCityName(
      {required Function(dynamic erro) onError,
      required String cityName}) async {
    Map<String, dynamic> query = {
      'q': cityName,
      'appid': apiKey,
    };
    DirectGeocoding geocodingData = await remoteService.getCoordinateByCityName(
        onError: (error) => onError(error), query: query);
    return geocodingData;
  }

  @override
  Future<DirectGeocoding> getCityNameByCoordinate({
    required Function(dynamic erro) onError,
    required String lat,
    required String lon,
  }) async {
    Map<String, dynamic> query = {
      'lat': lat,
      'lon': lon,
      'appid': apiKey,
    };
    DirectGeocoding geocodingData = await remoteService.getCityNameByCoordinate(
        query: query, onError: (error) => onError(error));
    return geocodingData;
  }

  @override
  Future<MainWeather> createOrUpdateWeather(MainWeather data) async {
    MainWeather result = await localService.createOrUpdateWeather(data);
    return result;
  }

  @override
  Future<void> deleteAllWeather() async {
    await localService.deleteAllWeather();
  }

  @override
  Future<List<MainWeather>> getAllWeather() async {
    List<MainWeather> result = await localService.getAllWeather();
    return result;
  }

  @override
  Future<void> writeSetting(AppSettings data) async {
    localService.writeSetting(data);
  }

  @override
  Future<AppSettings?> readSetting() {
    return localService.readSetting();
  }

  @override
  Future<void> clear() async {
    localService.clear();
  }
}
