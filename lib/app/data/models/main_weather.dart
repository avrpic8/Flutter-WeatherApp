import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainWeather  extends HiveObject{
  final String? cityName;
  final WeatherData weatherData;

  MainWeather({this.cityName, required this.weatherData});
}
