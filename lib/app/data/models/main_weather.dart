import 'package:flutter_weather/app/data/models/oneCall/weather_data.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'main_weather.g.dart';

@HiveType(typeId: 0)
class MainWeather  extends HiveObject{
  @HiveField(0)
  final String? cityName;
  @HiveField(1)
  final WeatherData weatherData;

  MainWeather({this.cityName, required this.weatherData});
}
