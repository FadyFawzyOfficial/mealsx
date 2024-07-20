import 'package:flutter/material.dart';
import 'meal_screen.dart';

import '../widgets/categories_grid_view.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MealScreen(
          title: 'Some title',
          meals: [],
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meals Categories')),
      body: CategoriesGridView(
        onCategorySelected: () => _selectCategory(context),
      ),
    );
  }
}
