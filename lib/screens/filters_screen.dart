import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../widgets/switch_filter.dart';
// import '../widgets/app_drawer.dart';
// import 'tabs_screen.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegetarian = false;
  var isVegan = false;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text(kFilters)),
      // drawer: AppDrawer(onDrawerItemPressed: (screenName) {
      //   Navigator.of(context).pop();
      //   if (screenName == kMeals) {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (context) => const TabsScreen()),
      //     );
      //   }
      // }),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: isGlutenFree,
            Filter.lactoseFree: isLactoseFree,
            Filter.vegetarian: isVegetarian,
            Filter.vegan: isVegan,
          });
        },
        child: Column(
          children: [
            SwitchFilter(
              value: isGlutenFree,
              onChanged: (isChecked) =>
                  setState(() => isGlutenFree = isChecked),
              title: 'Gluten-free',
              subTitle: 'Only include gluten-free meals.',
            ),
            SwitchFilter(
              value: isLactoseFree,
              onChanged: (isChecked) =>
                  setState(() => isLactoseFree = isChecked),
              title: 'Lactose-free',
              subTitle: 'Only include lactose-free meals.',
            ),
            SwitchFilter(
              value: isVegetarian,
              onChanged: (isChecked) =>
                  setState(() => isVegetarian = isChecked),
              title: 'Vegetarian',
              subTitle: 'Only include vegetarian meals.',
            ),
            SwitchFilter(
              value: isVegan,
              onChanged: (isChecked) => setState(() => isVegan = isChecked),
              title: 'Vegan',
              subTitle: 'Only include vegan meals.',
            ),
          ],
        ),
      ),
    );
  }
}
