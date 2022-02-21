import 'dart:convert';

class Wind {
    Wind({
        required this.speed,
        required this.deg,
        required this.gust,
    });

    final double speed;
    final int deg;
    final double gust;

    Wind copyWith({
        double? speed,
        int? deg,
        double? gust,
    }) => 
        Wind(
            speed: speed ?? this.speed,
            deg: deg ?? this.deg,
            gust: gust ?? this.gust,
        );

    factory Wind.fromJson(String str) => Wind.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        gust: json["gust"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
    };
}

