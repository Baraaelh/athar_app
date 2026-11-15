import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class DonorBanner extends StatelessWidget {
  const DonorBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      decoration: BoxDecoration(
        gradient: AppColors.donorBanner,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(alpha: 0.15),
            ),
            child: const Icon(Icons.favorite_rounded, color: AppColors.primary, size: 28),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.generousDonor,
                style: AppTextStyles.label.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Text(AppStrings.contributeToCommunity, style: AppTextStyles.body),
            ],
          ),
        ],
      ),
    );
  }
}
