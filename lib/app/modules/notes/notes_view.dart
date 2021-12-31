import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/core/theme/app_colors.dart';
import 'package:notes/app/modules/notes/local_widgets/loading_more_notes.dart';
import 'package:notes/app/modules/notes/local_widgets/note_card.dart';
import 'package:notes/app/modules/notes/local_widgets/notes_header.dart';
import 'package:notes/app/modules/notes/local_widgets/notes_loading.dart';
import 'package:notes/app/modules/notes/notes_controller.dart';
import 'package:notes/app/modules/profile/profile_controller.dart';

class NotesView extends StatelessWidget {
  final profileCtrl = Get.find<ProfileController>();
  final notesCtrl = Get.find<NotesController>();

  NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.secondary,
          onRefresh: () async {
            notesCtrl.getMyNotes(refresh: true);
            return;
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                NotesHeader(),
                Obx(() {
                  if (!notesCtrl.notesLoaded.value) {
                    return const NotesLoading();
                  }

                  return Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        clipBehavior: Clip.none,
                        padding: const EdgeInsets.only(top: 20, bottom: 100),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: width / (height * 0.7),
                        ),
                        itemCount: notesCtrl.notes.value.data.length,
                        itemBuilder: (context, int i) {
                          final note = notesCtrl.notes.value.data[i];

                          return NoteCard(
                            note: note,
                            margin: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              left: i % 2 != 0 ? 5 : 0,
                              right: i % 2 == 0 ? 5 : 0,
                            ),
                          );
                        },
                      ),
                      !notesCtrl.notes.value.meta.pagination.hasReachedMax
                          ? const LoadingMoreNotes()
                          : const SizedBox.shrink(),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
