import 'dart:convert';

import 'package:get/get.dart';
import 'package:notes/app/data/model/user.dart';
import 'package:notes/app/modules/profile/profile_controller.dart';
import 'package:notes/app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final SharedPreferences prefs;

  SplashController({required this.prefs});

  @override
  void onReady() {
    checkSession();
    super.onReady();
  }

  void checkSession() {
    final token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      final user = User.fromJson(jsonDecode(prefs.getString('user')!));
      Get.find<ProfileController>().user(user);
      Get.offAllNamed(Routes.home);
      return;
    }

    Get.offAllNamed(Routes.login);
  }
}
