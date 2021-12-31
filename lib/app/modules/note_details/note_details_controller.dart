import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/core/theme/app_colors.dart';
import 'package:notes/app/core/utils/snackbar_helper.dart';
import 'package:notes/app/data/model/note.dart';
import 'package:notes/app/data/provider/api_provider.dart';
import 'package:notes/app/modules/notes/notes_controller.dart';

class NoteDetailsController extends GetxController {
  final ApiProvider api;
  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final color = AppColors.grey.obs;
  Rx<bool> saveInProgress = false.obs;
  Rx<bool> deleteInProgress = false.obs;

  NoteDetailsController({required this.api});

  void initializeEditMode(Note note) {
    titleCtrl.text = note.title;
    descriptionCtrl.text = note.description;
    color(note.color);
  }

  void createNote() async {
    saveInProgress.value = true;

    final result = await api.createNote(Note(
      id: 0,
      title: titleCtrl.text,
      description: descriptionCtrl.text,
      color: color.value,
    ));

    result.fold(
      (failure) {
        SnackbarHelper.error(message: failure.message);
      },
      (note) {
        Get.find<NotesController>().getMyNotes(refresh: true);
        Get.back();
      },
    );

    saveInProgress.value = false;
  }

  void updateNote(int noteId) async {
    saveInProgress.value = true;

    final result = await api.updateNote(Note(
      id: noteId,
      title: titleCtrl.text,
      description: descriptionCtrl.text,
      color: color.value,
    ));

    result.fold(
      (failure) {
        SnackbarHelper.error(message: failure.message);
      },
      (note) {
        Get.find<NotesController>().getMyNotes(refresh: true);
        Get.back();
      },
    );

    saveInProgress.value = false;
  }

  void deleteNote(int noteId) async {
    deleteInProgress.value = true;

    final result = await api.deleteNote(noteId);

    result.fold(
      (failure) {
        SnackbarHelper.error(message: failure.message);
      },
      (note) {
        Get.find<NotesController>().getMyNotes(refresh: true);
        Get.back();
      },
    );

    deleteInProgress.value = false;
  }
}
