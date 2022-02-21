import 'dart:convert';

import 'package:flutter_weather/app/data/models/currentCall/clouds.dart';
import 'package:flutter_weather/app/data/models/currentCall/coord.dart';
import 'package:flutter_weather/app/data/models/currentCall/main.dart';
import 'package:flutter_weather/app/data/models/currentCall/sys.dart';
import 'package:flutter_weather/app/data/models/currentCall/weather_element.dart';
import 'package:flutter_weather/app/data/models/currentCall/wind.dart';

class WeatherData {
    WeatherData({
        required this.coord,
        required this.weather,
        required this.base,
        required this.main,
        required this.visibility,
        required this.wind,
        required this.clouds,
        required this.dt,
        required this.sys,
        required this.timezone,
        required this.id,
        required this.name,
        required this.cod,
    });

    final Coord coord;
    final List<Weather> weather;
    final String base;
    final Main main;
    final int visibility;
    final Wind wind;
    final Clouds clouds;
    final int dt;
    final Sys sys;
    final int timezone;
    final int id;
    final String name;
    final int cod;

    WeatherData copyWith({
        Coord? coord,
        List<Weather>? weather,
        String? base,
        Main? main,
        int? visibility,
        Wind? wind,
        Clouds? clouds,
        int? dt,
        Sys? sys,
        int? timezone,
        int? id,
        String? name,
        int? cod,
    }) => 
        WeatherData(
            coord: coord ?? this.coord,
            weather: weather ?? this.weather,
            base: base ?? this.base,
            main: main ?? this.main,
            visibility: visibility ?? this.visibility,
            wind: wind ?? this.wind,
            clouds: clouds ?? this.clouds,
            dt: dt ?? this.dt,
            sys: sys ?? this.sys,
            timezone: timezone ?? this.timezone,
            id: id ?? this.id,
            name: name ?? this.name,
            cod: cod ?? this.cod,
        );

    factory WeatherData.fromJson(String str) => WeatherData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory WeatherData.fromMap(Map<String, dynamic> json) => WeatherData(
        coord: Coord.fromMap(json["coord"]),
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        base: json["base"],
        main: Main.fromMap(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromMap(json["wind"]),
        clouds: Clouds.fromMap(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromMap(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
    );

    Map<String, dynamic> toMap() => {
        "coord": coord.toMap(),
        "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
        "base": base,
        "main": main.toMap(),
        "visibility": visibility,
        "wind": wind.toMap(),
        "clouds": clouds.toMap(),
        "dt": dt,
        "sys": sys.toMap(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
    };
}

