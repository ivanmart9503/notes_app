import 'package:get/get.dart';
import 'package:notes/app/core/utils/snackbar_helper.dart';
import 'package:notes/app/data/model/note_response.dart';
import 'package:notes/app/data/provider/api_provider.dart';

enum NotesStatus { initial, inProgress, success, failure }

class NotesController extends GetxController {
  final ApiProvider api;
  final notes = const NoteResponse().obs;
  Rx<bool> notesLoaded = false.obs;

  NotesController({required this.api});

  @override
  void onReady() {
    getMyNotes();
    super.onReady();
  }

  void getMyNotes({bool refresh = true}) async {
    // If user has reached max results, do nothing
    if (notes.value.meta.pagination.hasReachedMax && !refresh) {
      return;
    }

    if (refresh) {
      notesLoaded.value = false;
      notes(const NoteResponse());
    }

    final result = await api.getMyNotes(notes.value.meta.pagination.page + 1);

    result.fold(
      (failure) {
        SnackbarHelper.error(message: failure.message);
      },
      (response) {
        final newNotes = List.of(notes.value.data)..addAll(response.data);

        notes(NoteResponse(
          data: newNotes,
          meta: response.meta,
        ));
      },
    );

    notesLoaded.value = true;
  }
}
