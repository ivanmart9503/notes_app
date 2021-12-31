import 'package:flutter/material.dart';
import 'package:notes/app/core/theme/app_colors.dart';

class NotesLoading extends StatelessWidget {
  const NotesLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.35,
        ),
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(AppColors.secondary),
        ),
      ),
    );
  }
}
