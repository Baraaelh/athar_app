import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_image.dart';

class HomeHero extends StatelessWidget {
  const HomeHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.heroTitle, style: AppTextStyles.title.copyWith(fontSize: 22)),
              const SizedBox(height: 14),
              Text(AppStrings.heroSubtitle, style: AppTextStyles.body),
            ],
          ),
        ),
        Container(
          width: 76,
          height: 76,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryLight),
          padding: const EdgeInsets.all(14),
          child: const AppImage(
            AppAssets.sprout,
            fit: BoxFit.contain,
            placeholderIcon: Icons.spa_rounded,
          ),
        ),
      ],
    );
  }
}
