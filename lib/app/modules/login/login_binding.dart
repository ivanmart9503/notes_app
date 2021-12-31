import 'package:get/get.dart';
import 'package:notes/app/data/provider/api_provider.dart';
import 'package:notes/app/modules/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(api: Get.find<ApiProvider>()));
  }
}
