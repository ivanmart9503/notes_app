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
            Align(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    backgroundColor: AppColors.secondary.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation(
                      AppColors.secondary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
