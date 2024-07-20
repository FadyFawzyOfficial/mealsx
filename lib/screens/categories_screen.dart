import 'package:flutter/material.dart';

import '../widgets/categories_grid_view.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meals Categories')),
      body: const CategoriesGridView(),
    );
  }
}
