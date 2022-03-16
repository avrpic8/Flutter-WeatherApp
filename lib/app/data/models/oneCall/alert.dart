import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'alert.g.dart';
@HiveType(typeId: 7)
class Alert {
    Alert({
        this.senderName,
        this.event,
        this.start,
        this.end,
        this.description,
        this.tags,
    });

    @HiveField(0)
    final String? senderName;
    @HiveField(1)
    final String? event;
    @HiveField(2)
    final int? start;
    @HiveField(3)
    final int? end;
    @HiveField(4)
    final String? description;
    @HiveField(5)
    final List<dynamic>? tags;

    factory Alert.fromJson(String str) => Alert.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Alert.fromMap(Map<String, dynamic> json) => Alert(
        senderName: json["sender_name"],
        event: json["event"],
        start: json["start"],
        end: json["end"],
        description: json["description"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "sender_name": senderName,
        "event": event,
        "start": start,
        "end": end,
        "description": description,
        "tags": List<dynamic>.from(tags!.map((x) => x)),
    };
}