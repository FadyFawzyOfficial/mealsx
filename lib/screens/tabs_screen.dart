import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../data/dummy_meals.dart';
import '../models/meal.dart';
import '../widgets/app_drawer.dart';
import 'categories_screen.dart';
import 'filters_screen.dart';
import 'meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> favoriteMeals = [];
  int screenIndex = 0;
  var mealsFilter = {
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(['Meals Categories', 'Your Favorites'][screenIndex]),
      ),
      drawer: AppDrawer(onDrawerItemPressed: navigateFromDrawer),
      body: [
        CategoriesScreen(
          onMealFavoriteToggled: toggleMealFavoriteStatus,
          filteredMeals: filteredMeals,
        ),
        MealsScreen(
          meals: favoriteMeals,
          onMealFavoriteToggled: toggleMealFavoriteStatus,
        ),
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
      final filterResult = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
              builder: (context) => FiltersScreen(mealsFilter: mealsFilter)));

      setState(() => mealsFilter = filterResult ?? mealsFilter);
    }
  }

  List<Meal> get filteredMeals {
    return dummyMeals.where(
      (meal) {
        if (!meal.isGlutenFree && mealsFilter[Filter.glutenFree]!) {
          return false;
        }
        if (!meal.isLactoseFree && mealsFilter[Filter.lactoseFree]!) {
          return false;
        }
        if (!meal.isVegetarian && mealsFilter[Filter.vegetarian]!) {
          return false;
        }
        if (!meal.isVegan && mealsFilter[Filter.vegan]!) {
          return false;
        }
        return true;
      },
    ).toList();
  }

  void toggleMealFavoriteStatus(Meal meal) {
    setState(
      () {
        if (favoriteMeals.contains(meal)) {
          favoriteMeals.remove(meal);
          showInfoMessage('Meal is no longer a favorite');
        } else {
          favoriteMeals.add(meal);
          showInfoMessage('Marked as a favorite!');
        }
      },
    );
  }

  void showInfoMessage(String message) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}
