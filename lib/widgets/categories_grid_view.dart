import 'package:flutter/material.dart';

import '../data/dummy_categories.dart';
import 'category_grid_item.dart';

class CategoriesGridView extends StatelessWidget {
  final VoidCallback onCategorySelected;

  const CategoriesGridView({super.key, required this.onCategorySelected});

  @override
  Widget build(context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: availableCategories.length,
      itemBuilder: (context, index) => CategoryGridItem(
        category: availableCategories[index],
        onCategorySelected: onCategorySelected,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
    );
  }
}
