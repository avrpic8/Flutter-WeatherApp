import 'dart:convert';

import 'package:flutter_weather/app/data/models/oneCall/feels_like.dart';
import 'package:flutter_weather/app/data/models/oneCall/temp.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'daily.g.dart';

@HiveType(typeId: 6)
class Daily {
  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,
    this.rain,
  });

  @HiveField(0)
  final int? dt;
  @HiveField(1)
  final int? sunrise;
  @HiveField(2)
  final int? sunset;
  @HiveField(3)
  final int? moonrise;
  @HiveField(4)
  final int? moonset;
  @HiveField(5)
  final double? moonPhase;
  @HiveField(6)
  final Temp? temp;
  @HiveField(7)
  final FeelsLike? feelsLike;
  @HiveField(8)
  final int? pressure;
  @HiveField(9)
  final int? humidity;
  @HiveField(10)
  final double? dewPoint;
  @HiveField(11)
  final double? windSpeed;
  @HiveField(12)
  final int? windDeg;
  @HiveField(13)
  final double? windGust;
  @HiveField(14)
  final List<Weather>? weather;
  @HiveField(15)
  final int? clouds;
  @HiveField(16)
  final double? pop;
  @HiveField(17)
  final double? uvi;
  @HiveField(18)
  final double? rain;

  factory Daily.fromJson(String str) => Daily.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Daily.fromMap(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"].toDouble(),
        temp: Temp.fromMap(json["temp"]),
        feelsLike: FeelsLike.fromMap(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"].toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        clouds: json["clouds"],
        pop: json["pop"].toDouble(),
        uvi: json["uvi"].toDouble(),
        rain: json["rain"] == null ? null : json["rain"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp!.toMap(),
        "feels_like": feelsLike!.toMap(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather!.map((x) => x.toMap())),
        "clouds": clouds,
        "pop": pop,
        "uvi": uvi,
        "rain": rain == null ? null : rain,
      };
}
