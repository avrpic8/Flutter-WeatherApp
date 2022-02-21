import 'dart:convert';

class Coord {
    Coord({
        required this.lon,
        required this.lat,
    });

    final int lon;
    final int lat;

    Coord copyWith({
        int? lon,
        int? lat,
    }) => 
        Coord(
            lon: lon ?? this.lon,
            lat: lat ?? this.lat,
        );

    factory Coord.fromJson(String str) => Coord.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Coord.fromMap(Map<String, dynamic> json) => Coord(
        lon: json["lon"],
        lat: json["lat"],
    );

    Map<String, dynamic> toMap() => {
        "lon": lon,
        "lat": lat,
    };
}