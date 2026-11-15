import 'package:flutter/material.dart';

import '../../domain/entities/category_entity.dart';
import 'category_card.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < categories.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            Expanded(child: CategoryCard(category: categories[i])),
          ],
        ],
      ),
    );
  }
}
