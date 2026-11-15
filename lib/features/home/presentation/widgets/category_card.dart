import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/category_entity.dart';
import 'category_style.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category, this.onTap});

  final CategoryEntity category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final style = category.type.style;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 10),
        decoration: BoxDecoration(
          color: style.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: style.border),
        ),
        child: Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(shape: BoxShape.circle, color: style.iconBackground),
              child: Icon(style.icon, color: style.iconColor, size: 22),
            ),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                category.title,
                maxLines: 1,
                style: AppTextStyles.sectionTitle.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              category.description,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: AppTextStyles.tiny,
            ),
          ],
        ),
      ),
    );
  }
}
