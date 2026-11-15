import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, this.onNotificationsTap});

  final VoidCallback? onNotificationsTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.headerBackground,
      padding: EdgeInsets.fromLTRB(
          16, MediaQuery.paddingOf(context).top + 12, 16, 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AppAssets.logo, height: 48),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: IconButton(
              onPressed: onNotificationsTap,
              icon: const Icon(Icons.notifications_none_rounded,
                  size: 30, color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
