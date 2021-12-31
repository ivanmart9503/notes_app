import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/core/utils/snackbar_helper.dart';
import 'package:notes/app/data/provider/api_provider.dart';
import 'package:notes/app/modules/profile/profile_controller.dart';
import 'package:notes/app/routes/routes.dart';

class LoginController extends GetxController {
  final ApiProvider api;
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  RxBool showPassword = false.obs;
  RxBool loginInProgress = false.obs;

  LoginController({required this.api});

  Future<void> login() async {
    final validForm = formKey.currentState?.validate() ?? false;

    if (!validForm) {
      return;
    }

    loginInProgress.value = true;

    final result = await api.login(emailCtrl.text, passCtrl.text);

    result.fold(
      (failure) {
        SnackbarHelper.error(message: failure.message);
      },
      (user) {
        Get.find<ProfileController>().user(user);

        SnackbarHelper.toast(
          title: 'Bienvenido ${user.name}',
          message: 'Nos alegra que hayas regresado',
        );

        Get.offAllNamed(Routes.home);
      },
    );

    loginInProgress.value = false;
  }

  void showHidePassword() {
    showPassword.value = !showPassword.value;
  }
}
