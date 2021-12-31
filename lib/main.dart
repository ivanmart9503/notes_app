import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:notes/app/core/theme/app_colors.dart';
import 'package:notes/app/initial_binding.dart';
import 'package:notes/app/routes/pages.dart';
import 'package:notes/app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialBinding();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return GetMaterialApp(
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme(
          primary: AppColors.primary,
          primaryVariant: AppColors.primary,
          secondary: AppColors.secondary,
          secondaryVariant: AppColors.secondary,
          surface: AppColors.primary,
          background: Colors.white,
          error: Colors.red,
          onPrimary: AppColors.secondary,
          onSecondary: Colors.white,
          onSurface: AppColors.secondary,
          onBackground: AppColors.secondary,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.secondary,
          selectionColor: AppColors.secondary.withOpacity(0.2),
          selectionHandleColor: AppColors.secondary,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondary),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondary),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondary),
          ),
        ),
      ),
    );
  }
}
