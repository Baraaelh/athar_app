import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/account_type_card.dart';
import '../widgets/athar_logo_badge.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void _showComingSoon(BuildContext context) => ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text(AppStrings.comingSoon)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(gradient: AppColors.welcomeBackground),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const Spacer(flex: 3),
                const AtharLogoBadge(),
                const SizedBox(height: 36),
                Text(AppStrings.welcomeTitle, style: AppTextStyles.headline),
                const SizedBox(height: 22),
                Text(AppStrings.welcomeSubtitle, style: AppTextStyles.body),
                const SizedBox(height: 56),
                AccountTypeCard(
                  title: AppStrings.donorTitle,
                  subtitle: AppStrings.donorSubtitle,
                  icon: Icons.favorite_rounded,
                  iconColor: AppColors.primary,
                  iconBackground: AppColors.primaryLight,
                  onTap: () => Navigator.pushNamed(context, Routes.registerDonor),
                ),
                const SizedBox(height: 24),
                AccountTypeCard(
                  title: AppStrings.organizationTitle,
                  subtitle: AppStrings.organizationSubtitle,
                  icon: Icons.apartment_rounded,
                  iconColor: AppColors.organizationIcon,
                  iconBackground: AppColors.organizationIconBg,
                  onTap: () => _showComingSoon(context),
                ),
                const Spacer(flex: 4),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, Routes.main),
                  child: Text(
                    AppStrings.continueAsGuest,
                    style: AppTextStyles.bodyDark.copyWith(color: AppColors.black),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
