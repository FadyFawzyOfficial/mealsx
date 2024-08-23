import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/strings.dart';
import '../models/meal.dart';
import '../providers/favorite_meals_provider.dart';
import '../providers/filter_provider.dart';
import '../providers/meals_provider.dart';
import '../widgets/app_drawer.dart';
import 'categories_screen.dart';
import 'filters_screen.dart';
import 'meals_screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int screenIndex = 0;

  @override
  Widget build(context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(['Meals Categories', 'Your Favorites'][screenIndex]),
      ),
      drawer: AppDrawer(onDrawerItemPressed: navigateFromDrawer),
      body: [
        CategoriesScreen(filteredMeals: filteredMeals),
        MealsScreen(meals: favoriteMeals),
      ][screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectScreen,
        currentIndex: screenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  void selectScreen(int index) => setState(() => screenIndex = index);

  Future<void> navigateFromDrawer(String screen) async {
    Navigator.pop(context);
    if (screen == kFilters) {
      await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (context) => const FiltersScreen()));
    }
  }

  List<Meal> get filteredMeals {
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
  }
}
