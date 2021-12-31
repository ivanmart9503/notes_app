import 'package:flutter/material.dart';
import 'package:notes/app/core/theme/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            const SizedBox(height: 20),
            const Align(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  AppColors.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
