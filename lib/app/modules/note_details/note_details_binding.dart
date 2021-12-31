import 'package:get/get.dart';
import 'package:notes/app/data/provider/api_provider.dart';
import 'package:notes/app/modules/note_details/note_details_controller.dart';

class NoteDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NoteDetailsController>(
      NoteDetailsController(api: Get.find<ApiProvider>()),
    );
  }
}
