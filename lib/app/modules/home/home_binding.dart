import 'package:get/get.dart';
import 'package:notes/app/data/provider/api_provider.dart';
import 'package:notes/app/modules/home/home_controller.dart';
import 'package:notes/app/modules/notes/notes_controller.dart';
import 'package:notes/app/modules/profile/profile_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.find<ProfileController>();
    Get.put<NotesController>(NotesController(api: Get.find<ApiProvider>()));
  }
}
