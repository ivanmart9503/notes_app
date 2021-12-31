import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/app/modules/home/home_binding.dart';
import 'package:notes/app/modules/home/home_page.dart';
import 'package:notes/app/modules/login/login_binding.dart';
import 'package:notes/app/modules/login/login_page.dart';
import 'package:notes/app/modules/note_details/note_details_binding.dart';
import 'package:notes/app/modules/note_details/note_details_page.dart';
import 'package:notes/app/modules/register/register_binding.dart';
import 'package:notes/app/modules/register/register_page.dart';
import 'package:notes/app/modules/splash/splash_binding.dart';
import 'package:notes/app/modules/splash/splash_page.dart';
import 'package:notes/app/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(name: Routes.profile, page: () => const SizedBox.shrink()),
    GetPage(
      name: Routes.noteDetails,
      page: () => NoteDetailsPage(),
      binding: NoteDetailsBinding(),
    ),
  ];
}
