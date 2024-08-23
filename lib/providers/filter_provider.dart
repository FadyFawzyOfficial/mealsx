import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterProvider extends StateNotifier<Map<Filter, bool>> {
  FilterProvider()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void filter(Filter filter, bool isActive) {
    // state[filter] = isActive; // Not allowed! => mutating state
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider = StateNotifierProvider<FilterProvider, Map<Filter, bool>>(
    (ref) => FilterProvider());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final filters = ref.watch(filterProvider);
  return meals.where(
    (meal) {
      if (!meal.isGlutenFree && filters[Filter.glutenFree]!) {
        return false;
      }
      if (!meal.isLactoseFree && filters[Filter.lactoseFree]!) {
        return false;
      }
      if (!meal.isVegetarian && filters[Filter.vegetarian]!) {
        return false;
      }
      if (!meal.isVegan && filters[Filter.vegan]!) {
        return false;
      }
      return true;
    },
  ).toList();
});
