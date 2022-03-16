import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'feels_like.g.dart';

@HiveType(typeId: 5)
class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  @HiveField(0)
  final double? day;
  @HiveField(1)
  final double? night;
  @HiveField(2)
  final double? eve;
  @HiveField(3)
  final double? morn;

  factory FeelsLike.fromJson(String str) => FeelsLike.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeelsLike.fromMap(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}
