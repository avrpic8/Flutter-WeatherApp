import 'package:flutter_weather/app/core/keys.dart';
import 'package:flutter_weather/app/data/models/geocoding/direct_geocoding.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:flutter_weather/app/data/service/http_service.dart';
import 'package:flutter_weather/app/data/service/repository.dart';

class RepositoryImp implements Repository {
  final HttpService service;

  RepositoryImp({required this.service});

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
    WeatherData weatherData = await service.getWeatherByCoordinate(
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
    WeatherData weatherData = await service.getWeatherByCoordinate(
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
    WeatherData weatherData = await service.getWeatherByCoordinate(
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
    DirectGeocoding geocodingData = await service.getCoordinateByCityName(
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
    DirectGeocoding geocodingData = await service.getCityNameByCoordinate(
        query: query, onError: (error) => onError(error));
    return geocodingData;
  }
}
