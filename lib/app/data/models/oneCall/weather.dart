import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'weather.g.dart';
@HiveType(typeId: 4)
class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  @HiveType(typeId: 0)
  final int? id;
  @HiveType(typeId: 1)
  final String? main;
  @HiveType(typeId: 2)
  final String? description;
  @HiveType(typeId: 3)
  final String? icon;

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}
