import 'package:get/get.dart';
import 'package:notes/app/data/provider/api_provider.dart';
import 'package:notes/app/modules/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController(
      api: Get.find<ApiProvider>(),
    ));
  }
}
