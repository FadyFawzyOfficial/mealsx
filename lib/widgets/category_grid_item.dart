import 'package:flutter/material.dart';

import '../data/dummy_meals.dart';
import '../models/category.dart';
import '../screens/meal_screen.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;

  const CategoryGridItem({super.key, required this.category});

  @override
  Widget build(context) {
    return InkWell(
      onTap: () => _selectCategory(context, category),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.9),
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(
          category.title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }

  void _selectCategory(BuildContext context, Category category) {
    final categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealScreen(
          title: category.title,
          meals: categoryMeals,
        ),
      ),
    );
  }
}
