import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary, primary: AppColors.primary),
      scaffoldBackgroundColor: AppColors.white,
      splashFactory: InkRipple.splashFactory,
    );
    return base.copyWith(
      textTheme: GoogleFonts.alexandriaTextTheme(base.textTheme),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
