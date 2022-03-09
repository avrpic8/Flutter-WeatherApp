import 'dart:convert';

import 'package:flutter_weather/app/data/models/oneCall/alert.dart';
import 'package:flutter_weather/app/data/models/oneCall/current.dart';
import 'package:flutter_weather/app/data/models/oneCall/daily.dart';

class WeatherData {
  WeatherData({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.daily,
    this.alerts,
  });

  final double? lat;
  final double? lon;
  final String? timezone;
  final int? timezoneOffset;
  final Current? current;
  final List<Daily>? daily;
  final List<Alert>? alerts;

  factory WeatherData.fromJson(String str) =>
      WeatherData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherData.fromMap(Map<String, dynamic> json) => WeatherData(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current:
            json['current'] == null ? null : Current.fromMap(json["current"]),
        daily: json['daily'] == null
            ? null
            : List<Daily>.from(json["daily"].map((x) => Daily.fromMap(x))),
        alerts: json['alerts'] == null
            ? null
            : List<Alert>.from(json["alerts"].map((x) => Alert.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current!.toMap(),
        "daily": List<dynamic>.from(daily!.map((x) => x.toMap())),
        "alerts": List<dynamic>.from(alerts!.map((x) => x.toMap())),
      };
}
