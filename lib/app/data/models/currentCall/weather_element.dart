import 'dart:convert';

class Weather {
    Weather({
        required this.id,
        required this.main,
        required this.description,
        required this.icon,
    });

    final int id;
    final String main;
    final String description;
    final String icon;

    Weather copyWith({
        int? id,
        String? main,
        String? description,
        String? icon,
    }) => 
        Weather(
            id: id ?? this.id,
            main: main ?? this.main,
            description: description ?? this.description,
            icon: icon ?? this.icon,
        );

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
