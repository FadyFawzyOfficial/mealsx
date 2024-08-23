import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/categories_grid_view.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> filteredMeals;

  const CategoriesScreen({super.key, required this.filteredMeals});

  @override
  Widget build(context) =>
      Scaffold(body: CategoriesGridView(filteredMeals: filteredMeals));
}
