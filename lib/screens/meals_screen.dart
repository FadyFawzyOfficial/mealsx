import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/empty_meals.dart';
import '../widgets/meal_list_item.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;

  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  @override
  Widget build(context) {
    return Scaffold(
      appBar: title != null ? AppBar(title: Text(title!)) : null,
      body: meals.isNotEmpty ? MealsListView(meals: meals) : const EmptyMeals(),
    );
  }
}

class MealsListView extends StatelessWidget {
  const MealsListView({super.key, required this.meals});

  final List<Meal> meals;

  @override
  Widget build(context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: meals.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => MealListItem(meal: meals[index]),
    );
  }
}
