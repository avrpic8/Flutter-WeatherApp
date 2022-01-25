import 'package:flutter_weather/app/data/models/oneCall/current.dart';
import 'package:flutter_weather/app/data/models/oneCall/minutley.dart';

class WeatherData {
  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Minutely>? minutely;

  WeatherData(
      {this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.minutely});

  WeatherData.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    if (json['minutely'] != null) {
      minutely = <Minutely>[];
      json['minutely'].forEach((v) {
        minutely!.add(Minutely.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = lat;
    data['lon'] = lon;
    data['timezone'] = timezone;
    data['timezone_offset'] = timezoneOffset;
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (minutely != null) {
      data['minutely'] = minutely!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
