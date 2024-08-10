import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/categories_grid_view.dart';

class CategoriesScreen extends StatelessWidget {
  final Function(Meal meal) onMealFavoriteToggled;
  const CategoriesScreen({super.key, required this.onMealFavoriteToggled});

  @override
  Widget build(context) {
    return Scaffold(
      body: CategoriesGridView(onMealFavoriteToggled: onMealFavoriteToggled),
    );
  }
}
