import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class AtharLogoBadge extends StatelessWidget {
  const AtharLogoBadge({super.key, this.size = 76});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, gradient: AppColors.logoGradient),
      alignment: Alignment.center,
      child: Text(
        AppStrings.logoLetter,
        style: TextStyle(
          fontFamily: AppTextStyles.fontFamily,
          fontSize: size * 0.42,
          color: AppColors.white,
        ),
      ),
    );
  }
}
