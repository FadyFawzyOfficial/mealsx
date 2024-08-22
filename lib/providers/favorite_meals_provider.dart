import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    final isMealFavorite = state.contains(meal);

    state = isMealFavorite
        ? state.where((m) => m.id != meal.id).toList()
        : [...state, meal];
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());
