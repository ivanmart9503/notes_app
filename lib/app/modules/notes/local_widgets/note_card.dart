import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/data/model/note.dart';
import 'package:notes/app/routes/routes.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final EdgeInsets margin;

  const NoteCard({
    Key? key,
    required this.note,
    required this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.noteDetails,
        arguments: {'note': note, 'editMode': true},
      ),
      child: Container(
        decoration: BoxDecoration(
          color: note.color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        margin: margin,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              note.description,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            const Align(
              alignment: Alignment.centerRight,
              child: Icon(EvaIcons.expandOutline),
            ),
          ],
        ),
      ),
    );
  }
}
