import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// "icon + title ———" section header used in forms.
class SectionDividerTitle extends StatelessWidget {
  const SectionDividerTitle(
      {super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: 22),
        const SizedBox(width: 6),
        Text(title, style: AppTextStyles.label),
        const SizedBox(width: 10),
        const Expanded(child: Divider(color: AppColors.divider, thickness: 1)),
      ],
    );
  }
}
