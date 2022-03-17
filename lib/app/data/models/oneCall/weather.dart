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

  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? main;
  @HiveField(2)
  final String? description;
  @HiveField(3)
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
