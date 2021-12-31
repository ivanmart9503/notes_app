import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:notes/app/core/constants/constants.dart';
import 'package:notes/app/data/model/user.dart';
import 'package:notes/app/data/provider/api_provider.dart';
import 'package:notes/app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final ApiProvider api;
  final SharedPreferences prefs;
  final user = User(id: 0, name: '', email: '', username: '').obs;
  Rx<String> avatar = ''.obs;

  ProfileController({required this.api, required this.prefs});

  @override
  void onReady() {
    const defaultAvatar = maleAvatar1;
    final _avatar = prefs.getString('avatar') ?? '';

    if (_avatar.isEmpty) {
      prefs.setString('avatar', defaultAvatar);
      avatar.value = defaultAvatar;
      return;
    }

    avatar.value = _avatar;

    super.onReady();
  }

  void updateAvatar(String path) {
    prefs.setString('avatar', path);
    avatar.value = path;
  }

  void logout(BuildContext context) async {
    await prefs.clear();
    Get.offAllNamed(Routes.login);
  }
}
