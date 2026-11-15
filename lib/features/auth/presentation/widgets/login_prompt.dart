import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class LoginPrompt extends StatelessWidget {
  const LoginPrompt({super.key, required this.onLoginTap});

  final VoidCallback onLoginTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppTextStyles.bodyDark.copyWith(color: AppColors.black),
        children: [
          const TextSpan(text: AppStrings.haveAccount),
          TextSpan(
            text: AppStrings.login,
            style: AppTextStyles.link,
            recognizer: TapGestureRecognizer()..onTap = onLoginTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
