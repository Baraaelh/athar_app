import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Asset image that degrades to a neutral placeholder when the file is missing.
class AppImage extends StatelessWidget {
  const AppImage(
    this.path, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholderIcon = Icons.image_outlined,
  });

  final String path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final IconData placeholderIcon;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => Container(
        width: width,
        height: height,
        color: AppColors.primarySurface,
        alignment: Alignment.center,
        child: Icon(placeholderIcon, color: AppColors.primary, size: 40),
      ),
    );
  }
}
