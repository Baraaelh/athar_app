import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: AppColors.inputBorder),
    );
    return TextField(
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      style: AppTextStyles.bodyDark.copyWith(color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: AppStrings.searchHint,
        hintStyle: AppTextStyles.body,
        filled: true,
        fillColor: AppColors.headerBackground,
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        prefixIcon: const Padding(
          padding: EdgeInsetsDirectional.only(start: 12, end: 4),
          child: Icon(Icons.search_rounded, size: 32, color: AppColors.textSecondary),
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: const BorderSide(color: AppColors.primary)),
      ),
    );
  }
}
