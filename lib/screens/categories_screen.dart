import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/categories_grid_view.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Meal> filteredMeals;

  const CategoriesScreen({super.key, required this.filteredMeals});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      // lowerBound: 0,
      // upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        child: CategoriesGridView(
          filteredMeals: widget.filteredMeals,
        ),
        builder: (context, child) => SlideTransition(
          position: _animationController.drive(
            Tween(
              begin: const Offset(0, 0.5),
              end: const Offset(0, 0),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
