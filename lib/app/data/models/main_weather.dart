import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';

class MainWeather {
  final String? cityName;
  final WeatherData weatherData;

  MainWeather({this.cityName, required this.weatherData});
}
