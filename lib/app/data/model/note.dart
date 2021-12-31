import 'dart:ui';

class Note {
  final int id;
  final String title;
  final String description;
  final Color color;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] ?? 0,
      title: json['attributes']['title'] ?? '',
      description: json['attributes']['description'] ?? '',
      color: Color(int.parse(json['attributes']['color'])),
    );
  }

  Map<String, dynamic> toJsonRequest() {
    return {
      "data": {
        "title": title,
        "description": description,
        "color": color.value,
      }
    };
  }
}
