import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/data/model/note.dart';

class NoteDetailsPage extends StatelessWidget {
  final Note note = Get.arguments as Note;

  NoteDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: note.color,
      body: Center(
        child: Text(note.description),
      ),
    );
  }
}
