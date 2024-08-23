import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/categories_grid_view.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Meal> filteredMeals;

  const CategoriesScreen({super.key, required this.filteredMeals});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(context) =>
      Scaffold(body: CategoriesGridView(filteredMeals: widget.filteredMeals));
}
