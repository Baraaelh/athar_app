import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/category_entity.dart';

/// Visual style (colors + icon) for each category – presentation concern only.
class CategoryStyle {
  const CategoryStyle({
    required this.background,
    required this.border,
    required this.iconBackground,
    required this.iconColor,
    required this.icon,
  });

  final Color background;
  final Color border;
  final Color iconBackground;
  final Color iconColor;
  final IconData icon;
}

extension CategoryTypeStyle on CategoryType {
  CategoryStyle get style => switch (this) {
        CategoryType.orphans => const CategoryStyle(
            background: AppColors.orphansBg,
            border: AppColors.orphansBorder,
            iconBackground: AppColors.orphansIconBg,
            iconColor: AppColors.orphansIcon,
            icon: Icons.sentiment_satisfied_alt_rounded,
          ),
        CategoryType.students => const CategoryStyle(
            background: AppColors.studentsBg,
            border: AppColors.studentsBorder,
            iconBackground: AppColors.studentsIconBg,
            iconColor: AppColors.studentsIcon,
            icon: Icons.school_rounded,
          ),
        CategoryType.families => const CategoryStyle(
            background: AppColors.familiesBg,
            border: AppColors.familiesBorder,
            iconBackground: AppColors.familiesIconBg,
            iconColor: AppColors.familiesIcon,
            icon: Icons.family_restroom_rounded,
          ),
        CategoryType.patients => const CategoryStyle(
            background: AppColors.patientsBg,
            border: AppColors.patientsBorder,
            iconBackground: AppColors.patientsIconBg,
            iconColor: AppColors.patientsIcon,
            icon: Icons.favorite_rounded,
          ),
      };
}
