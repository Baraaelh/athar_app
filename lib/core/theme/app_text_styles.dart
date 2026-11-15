import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Typography used across the app (Alexandria – Arabic friendly).
abstract final class AppTextStyles {
  /// Bundled in `assets/fonts` (works offline, no runtime download).
  static const String fontFamily = 'Alexandria';

  static TextStyle _base({
    required double size,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.textPrimary,
    double? height,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
      );

  static TextStyle get headline =>
      _base(size: 26, weight: FontWeight.w700, color: AppColors.black);
  static TextStyle get title =>
      _base(size: 20, weight: FontWeight.w700, color: AppColors.black);
  static TextStyle get appBarTitle =>
      _base(size: 20, weight: FontWeight.w700, color: AppColors.black);
  static TextStyle get cardTitle =>
      _base(size: 17, weight: FontWeight.w700, color: AppColors.black);
  static TextStyle get sectionTitle =>
      _base(size: 15, weight: FontWeight.w700, color: AppColors.black);
  static TextStyle get body => _base(size: 14, color: AppColors.textSecondary);
  static TextStyle get bodyDark => _base(size: 14, color: AppColors.textHint);
  static TextStyle get small =>
      _base(size: 12, color: AppColors.textSecondary, height: 1.6);
  static TextStyle get tiny =>
      _base(size: 10, color: AppColors.textSecondary, height: 1.5);
  static TextStyle get label =>
      _base(size: 14, weight: FontWeight.w500, color: AppColors.primary);
  static TextStyle get button =>
      _base(size: 15, weight: FontWeight.w700, color: AppColors.white);
  static TextStyle get link =>
      _base(size: 14, weight: FontWeight.w700, color: AppColors.primary);
}
