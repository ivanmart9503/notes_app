import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/core/theme/app_colors.dart';
import 'package:notes/app/modules/note_details/note_details_controller.dart';

class DeleteButton extends StatelessWidget {
  final int? noteId;
  final bool show;
  final controller = Get.find<NoteDetailsController>();

  DeleteButton({
    Key? key,
    required this.noteId,
    required this.show,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!show) {
      return const SizedBox.shrink();
    }

    return Obx(
      () => IconButton(
        onPressed: () {
          if (!controller.deleteInProgress.value) {
            controller.deleteNote(noteId!);
          }
        },
        icon: controller.deleteInProgress.value
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation(AppColors.secondary),
                ),
              )
            : const Icon(EvaIcons.trashOutline),
      ),
    );
  }
}
