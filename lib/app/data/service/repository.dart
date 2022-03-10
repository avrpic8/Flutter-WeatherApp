import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';

abstract class Repository {


  Future<WeatherData> getCurrentWeatherByCoordinate({
    required Function(dynamic erro) onError,
    required String lat,
    required String lon,
  });

  void getWeatherByCoordinate({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic erro) onError,
    required String lat,
    required String lon,
  });

  // void getCurrentWeatherByCoordinate({
  //   required Function() beforeSend,
  //   required Function(dynamic data) onSuccess,
  //   required Function(dynamic erro) onError,
  //   required String lat,
  //   required String lon,
  // });

  void getDailyWeatherByCoordinate({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic erro) onError,
    required String lat,
    required String lon,
  });

  void getCoordinateByCityName({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic erro) onError,
    required String cityName
  });
}
