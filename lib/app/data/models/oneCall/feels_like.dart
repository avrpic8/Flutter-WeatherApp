import 'dart:convert';

class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  final double? day;
  final double? night;
  final double? eve;
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
