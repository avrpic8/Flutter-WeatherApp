import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';


part 'temp.g.dart';

@HiveType(typeId: 3)
class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  @HiveField(0)
  final double? day;
  @HiveField(1)
  final double? min;
  @HiveField(2)
  final double? max;
  @HiveField(3)
  final double? night;
  @HiveField(4)
  final double? eve;
  @HiveField(5)
  final double? morn;

  factory Temp.fromJson(String str) => Temp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Temp.fromMap(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}
