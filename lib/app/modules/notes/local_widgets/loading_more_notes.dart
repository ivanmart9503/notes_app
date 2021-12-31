import 'package:flutter/material.dart';
import 'package:notes/app/core/theme/app_colors.dart';

class LoadingMoreNotes extends StatelessWidget {
  const LoadingMoreNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(AppColors.secondary),
      ),
    );
  }
}
