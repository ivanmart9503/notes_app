import 'package:get/get.dart';
import 'package:notes/app/modules/splash/splash_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(prefs: Get.find<SharedPreferences>()));
  }
}
