import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, this.onNotificationsTap});

  final VoidCallback? onNotificationsTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.headerBackground,
      padding: EdgeInsets.fromLTRB(16, MediaQuery.paddingOf(context).top + 12, 16, 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppStrings.appName, style: AppTextStyles.logo),
              const SizedBox(width: 6),
              const Icon(Icons.eco_rounded, color: AppColors.primary, size: 28),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: IconButton(
              onPressed: onNotificationsTap,
              icon: const Icon(Icons.notifications_none_rounded, size: 30, color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
