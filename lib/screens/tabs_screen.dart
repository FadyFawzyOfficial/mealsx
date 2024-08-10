import 'package:flutter/material.dart';

import '../constants/strings.dart';
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

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(['Meals Categories', 'Your Favorites'][screenIndex]),
      ),
      drawer: AppDrawer(onDrawerItemPressed: navigateFromDrawer),
      body: [
        CategoriesScreen(onMealFavoriteToggled: toggleMealFavoriteStatus),
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

  void navigateFromDrawer(String screen) {
    Navigator.pop(context);
    if (screen == kFilters) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const FiltersScreen()));
    }
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
