import 'package:flutter/material.dart';

/// Centralised color palette extracted from the Athar design.
abstract final class AppColors {
  // Brand
  static const Color primary = Color(0xFF10B981);
  static const Color primaryDark = Color(0xFF0B5D3F);
  static const Color primaryLight = Color(0xFFD1FAE5);
  static const Color primarySurface = Color(0xFFECFDF5);

  // Neutrals
  static const Color white = Colors.white;
  static const Color black = Color(0xFF111111);
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF4B5563);
  static const Color border = Color(0xFFE5E7EB);
  static const Color inputBorder = Color(0xFFD1D5DB);
  static const Color scaffold = Color(0xFFF8FAFC);
  static const Color headerBackground = Color(0xFFF5F7F6);
  static const Color divider = Color(0xFFCBD5E1);
  static const Color disabled = Color(0xFFE5E7EB);
  static const Color disabledText = Color(0xFF6B7280);

  // Categories
  static const Color orphansBg = Color(0xFFECFDF5);
  static const Color orphansBorder = Color(0xFFA7F3D0);
  static const Color orphansIconBg = Color(0xFFD1FAE5);
  static const Color orphansIcon = Color(0xFF10B981);

  static const Color studentsBg = Color(0xFFEFF6FF);
  static const Color studentsBorder = Color(0xFFBFDBFE);
  static const Color studentsIconBg = Color(0xFFBFDBFE);
  static const Color studentsIcon = Color(0xFF3B82F6);

  static const Color familiesBg = Color(0xFFFEFCE8);
  static const Color familiesBorder = Color(0xFFFDE68A);
  static const Color familiesIconBg = Color(0xFFFDE68A);
  static const Color familiesIcon = Color(0xFFF59E0B);

  static const Color patientsBg = Color(0xFFFEF2F2);
  static const Color patientsBorder = Color(0xFFFECACA);
  static const Color patientsIconBg = Color(0xFFFECACA);
  static const Color patientsIcon = Color(0xFFEF4444);

  // Organization card
  static const Color organizationIconBg = Color(0xFFDBEAFE);
  static const Color organizationIcon = Color(0xFF3B82F6);

  // Gradients
  static const LinearGradient logoGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF0B4D35), Color(0xFF10B981)],
  );

  static const LinearGradient welcomeBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0, 0.35],
    colors: [Color(0xFFEFFDF4), Colors.white],
  );

  static const LinearGradient donorBanner = LinearGradient(
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.centerEnd,
    colors: [Color(0xFFD1FAE5), Color(0xFFFFFFFF)],
  );

  static const LinearGradient sponsoredOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x99000000), Color(0x66000000)],
  );
}
