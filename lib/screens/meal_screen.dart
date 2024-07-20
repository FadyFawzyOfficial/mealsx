import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;

  const MealScreen({super.key, required this.title, required this.meals});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: meals.isNotEmpty ? MealsListView(meals: meals) : const EmptyMeals(),
    );
  }
}

class MealsListView extends StatelessWidget {
  const MealsListView({super.key, required this.meals});

  final List<Meal> meals;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return ListTile(
          leading: Image.network(meal.imageUrl),
          title: Text(meal.title),
        );
      },
    );
  }
}

class EmptyMeals extends StatelessWidget {
  const EmptyMeals({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
