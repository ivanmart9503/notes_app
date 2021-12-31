import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void error({
    required String message,
    SnackPosition position = SnackPosition.BOTTOM,
  }) {
    return toast(
      message: message,
      title: 'Error',
      backgroundColor: Colors.red.shade400,
      position: position,
    );
  }

  static void toast({
    required String message,
    String title = '¡Excelente!',
    Color? backgroundColor,
    SnackPosition position = SnackPosition.BOTTOM,
  }) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: position,
      isDismissible: true,
      backgroundColor: backgroundColor ?? Colors.green.shade400,
      borderRadius: 0,
      colorText: Colors.white,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      animationDuration: const Duration(milliseconds: 800),
      shouldIconPulse: false,
    );
  }
}
