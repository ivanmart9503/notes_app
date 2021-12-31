import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/core/utils/snackbar_helper.dart';
import 'package:notes/app/data/provider/api_provider.dart';
import 'package:notes/app/modules/profile/profile_controller.dart';
import 'package:notes/app/routes/routes.dart';

class RegisterController extends GetxController {
  final ApiProvider api;
  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  RxBool showPassword = false.obs;
  RxBool registerInProgress = false.obs;

  RegisterController({required this.api});

  Future<void> register() async {
    final validForm = formKey.currentState?.validate() ?? false;

    if (!validForm) {
      return;
    }

    registerInProgress.value = true;

    final result = await api.register({
      'name': nameCtrl.text,
      'username': usernameCtrl.text,
      'email': emailCtrl.text,
      'password': passCtrl.text,
    });

    result.fold(
      (failure) {
        SnackbarHelper.error(message: failure.message);
      },
      (user) {
        Get.find<ProfileController>().user(user);
        SnackbarHelper.toast(
          title: 'Bienvenido ${user.name}',
          message: 'Nos alegra que seas parte de esto',
        );
        Get.offAllNamed(Routes.home);
      },
    );

    registerInProgress.value = false;
  }

  void showHidePassword() {
    showPassword.value = !showPassword.value;
  }
}
