import 'dart:convert';

class Clouds {
    Clouds({
        required this.all,
    });

    final int all;

    Clouds copyWith({
        int? all,
    }) => 
        Clouds(
            all: all ?? this.all,
        );

    factory Clouds.fromJson(String str) => Clouds.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toMap() => {
        "all": all,
    };
}