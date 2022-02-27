import 'dart:convert';

class Alert {
    Alert({
        this.senderName,
        this.event,
        this.start,
        this.end,
        this.description,
        this.tags,
    });

    final String? senderName;
    final String? event;
    final int? start;
    final int? end;
    final String? description;
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