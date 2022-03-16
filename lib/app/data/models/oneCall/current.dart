import 'dart:convert';

import 'package:flutter_weather/app/data/models/oneCall/weather.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'current.g.dart';

@HiveType(typeId: 2)
class Current {
  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
  });

  @HiveField(0)
  final int? dt;
  @HiveField(1)
  final int? sunrise;
  @HiveField(2)
  final int? sunset;
  @HiveField(3)
  final double? temp;
  @HiveField(4)
  final double? feelsLike;
  @HiveField(5)
  final int? pressure;
  @HiveField(6)
  final int? humidity;
  @HiveField(7)
  final double? dewPoint;
  @HiveField(8)
  final double? uvi;
  @HiveField(9)
  final int? clouds;
  @HiveField(10)
  final int? visibility;
  @HiveField(11)
  final double? windSpeed;
  @HiveField(12)
  final int? windDeg;
  @HiveField(13)
  final double? windGust;
  @HiveField(14)
  final List<Weather>? weather;

  factory Current.fromJson(String str) => Current.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Current.fromMap(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"].toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather!.map((x) => x.toMap())),
      };
}
