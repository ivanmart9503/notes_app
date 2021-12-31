import 'package:flutter/material.dart';
import 'package:notes/app/core/theme/app_colors.dart';

class Footer extends StatelessWidget {
  final String text;
  final String clickableText;
  final VoidCallback onTap;

  const Footer({
    Key? key,
    required this.text,
    required this.clickableText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: RichText(
            text: TextSpan(
              text: text,
              children: [
                TextSpan(
                  text: clickableText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
              style: const TextStyle(
                fontFamily: 'Roboto',
                color: AppColors.secondary,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
