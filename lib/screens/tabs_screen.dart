import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _screenIndex = 0;

  selectScreen(int index) => setState(() => _screenIndex = index);

  @override
  Widget build(context) {
    return Scaffold(
      body: [
        const CategoriesScreen(),
        const MealsScreen(title: 'Favorites', meals: []),
      ][_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectScreen,
        currentIndex: _screenIndex,
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
}
