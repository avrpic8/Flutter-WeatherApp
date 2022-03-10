import 'package:flutter_weather/app/core/keys.dart';
import 'package:flutter_weather/app/data/models/geocoding/direct_geocoding.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:flutter_weather/app/data/service/http_service.dart';
import 'package:flutter_weather/app/data/service/repository.dart';

class RepositoryImp implements Repository {
  final HttpSerrvice service;

  RepositoryImp({required this.service});

  @override
  Future<WeatherData> getCurrentWeatherByCoordinate(
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

  // @override
  // void getWeatherByCoordinate(
  //     {required Function() beforeSend,
  //     required Function(dynamic data) onSuccess,
  //     required Function(dynamic erro) onError,
  //     required String lat,
  //     required String lon}) {
  //   Map<String, dynamic> query = {
  //     'lat': lat,
  //     'lon': lon,
  //     'exclude': '',
  //     'appid': apiKey
  //   };
  //   service.getWeatherByCoordinate(
  //       beforeSend: () => beforeSend(),
  //       onSuccess: (data) {
  //         WeatherData weather = WeatherData.fromMap(data);
  //         onSuccess(weather);
  //       },
  //       onError: (error) => onError(error),
  //       query: query);
  // }

  // @override
  // void getCurrentWeatherByCoordinate(
  //     {required Function() beforeSend,
  //     required Function(dynamic data) onSuccess,
  //     required Function(dynamic erro) onError,
  //     required String lat,
  //     required String lon}) {
  //   Map<String, dynamic> query = {
  //     'lat': lat,
  //     'lon': lon,
  //     'exclude': 'minutely,hourly,daily',
  //     'appid': apiKey
  //   };
  //   service.getWeatherByCoordinate(
  //       beforeSend: () => beforeSend(),
  //       onSuccess: (data) {
  //         WeatherData weather = WeatherData.fromMap(data);
  //         onSuccess(weather);
  //       },
  //       onError: (error) => onError(error),
  //       query: query);
  // }

  // @override
  // void getDailyWeatherByCoordinate(
  //     {required Function() beforeSend,
  //     required Function(dynamic data) onSuccess,
  //     required Function(dynamic erro) onError,
  //     required String lat,
  //     required String lon}) {
  //   Map<String, dynamic> query = {
  //     'lat': lat,
  //     'lon': lon,
  //     'exclude': 'minutely,hourly,current',
  //     'appid': apiKey
  //   };
  //   service.getWeatherByCoordinate(
  //       beforeSend: () => beforeSend(),
  //       onSuccess: (data) {
  //         WeatherData weather = WeatherData.fromMap(data);
  //         onSuccess(weather);
  //       },
  //       onError: (error) => onError(error),
  //       query: query);
  // }

  @override
  void getCoordinateByCityName(
      {required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic erro) onError,
      required String cityName}) {
    Map<String, dynamic> query = {'q': cityName, 'appid': apiKey};
    service.getCoordianteByCityName(
        beforeSend: () => beforeSend(),
        onSuccess: (data) {
          DirectGeocoding geocoding = DirectGeocoding.fromMap(data[0]);
          onSuccess(geocoding);
        },
        onError: (error) => onError(error),
        query: query);
  }


  @override
  void getDailyWeatherByCoordinate({required Function() beforeSend, required Function(dynamic data) onSuccess, required Function(dynamic erro) onError, required String lat, required String lon}) {
    // TODO: implement getDailyWeatherByCoordinate
  }

  @override
  void getWeatherByCoordinate({required Function() beforeSend, required Function(dynamic data) onSuccess, required Function(dynamic erro) onError, required String lat, required String lon}) {
    // TODO: implement getWeatherByCoordinate
  }
}
