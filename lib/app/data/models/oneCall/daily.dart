import 'dart:convert';

import 'package:flutter_weather/app/data/models/oneCall/feels_like.dart';
import 'package:flutter_weather/app/data/models/oneCall/temp.dart';
import 'package:flutter_weather/app/data/models/oneCall/weather.dart';

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

  final int? dt;
  final int? sunrise;
  final int? sunset;
  final int? moonrise;
  final int? moonset;
  final double? moonPhase;
  final Temp? temp;
  final FeelsLike? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? dewPoint;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;
  final List<Weather>? weather;
  final int? clouds;
  final double? pop;
  final double? uvi;
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
