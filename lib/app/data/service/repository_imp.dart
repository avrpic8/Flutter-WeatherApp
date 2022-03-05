import 'package:flutter_weather/app/core/keys.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:flutter_weather/app/data/service/http_service.dart';
import 'package:flutter_weather/app/data/service/repository.dart';

class RepositoryImp implements Repository {
  final HttpSerrvice serrvice;

  RepositoryImp({required this.serrvice});

  @override
  void getCurrentWeatherByCoordinate(
      {required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic erro) onError,
      required String lat,
      required String lon}) {
    Map<String, dynamic> query = {
      'lat': lat,
      'lon': lon,
      'exclude': 'minutely,hourly,daily',
      'appid': apiKey
    };
    serrvice.get(
        beforeSend: () => beforeSend(),
        onSuccess: (data) {
          WeatherData weather = WeatherData.fromMap(data);
          onSuccess(weather);
        },
        onError: (error) => onError(error),
        query: query);
  }

  @override
  void getDailyWeatherByCoordinate(
      {required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic erro) onError,
      required String lat,
      required String lon}) {
    Map<String, dynamic> query = {
      'lat': lat,
      'lon': lon,
      'exclude': 'minutely,hourly,current',
      'appid': apiKey
    };
    serrvice.get(
        beforeSend: () => beforeSend(),
        onSuccess: (data) {
          WeatherData weather = WeatherData.fromMap(data);
          onSuccess(weather);
        },
        onError: (error) => onError(error),
        query: query);
  }
}
