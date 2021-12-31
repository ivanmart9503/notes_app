import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:notes/app/data/model/note.dart';
import 'package:notes/app/modules/note_details/local_widgets/color_picker.dart';
import 'package:notes/app/modules/note_details/local_widgets/delete_button.dart';
import 'package:notes/app/modules/note_details/note_details_controller.dart';

class NoteDetailsPage extends StatelessWidget {
  final bool editMode = Get.arguments['editMode'] ?? false;
  final Note? note = Get.arguments['note'];

  NoteDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<NoteDetailsController>(
      init: Get.find<NoteDetailsController>(),
      initState: (controller) {
        if (editMode) {
          controller.controller!.initializeEditMode(note!);
        }
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: controller.color.value,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              ColorPicker(),
              DeleteButton(noteId: note?.id, show: editMode),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 5,
                ),
                child: TextFormField(
                  autocorrect: true,
                  controller: controller.titleCtrl,
                  textCapitalization: TextCapitalization.sentences,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    hintText: 'Título',
                    hintStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: TextFormField(
                    expands: true,
                    minLines: null,
                    maxLines: null,
                    controller: controller.descriptionCtrl,
                    autocorrect: true,
                    textCapitalization: TextCapitalization.sentences,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: 'Escribe algo',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            icon: !controller.saveInProgress.value
                ? const Icon(EvaIcons.saveOutline)
                : const SizedBox.shrink(),
            label: !controller.saveInProgress.value
                ? const Text('Guardar')
                : const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(),
                  ),
            onPressed: () {
              if (editMode) {
                controller.updateNote(note!.id);
                return;
              }

              controller.createNote();
            },
          ),
        );
      },
    );
  }
}
