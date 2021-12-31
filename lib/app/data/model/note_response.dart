import 'package:notes/app/data/model/meta.dart';
import 'package:notes/app/data/model/note.dart';

class NoteResponse {
  final List<Note> data;
  final Meta meta;

  const NoteResponse({
    this.data = const [],
    this.meta = const Meta(),
  });

  factory NoteResponse.fromJson(Map<String, dynamic> json) {
    return NoteResponse(
      data: json['data'] != null
          ? (json['data'] as List<dynamic>)
              .map((e) => Note.fromJson(e))
              .toList()
          : [],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : const Meta(),
    );
  }
}
