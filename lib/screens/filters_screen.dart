import 'package:flutter/material.dart';

import '../constants/materials.dart';
import '../constants/strings.dart';
import '../widgets/app_drawer.dart';
import 'tabs_screen.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text(kFilters)),
      drawer: AppDrawer(onDrawerItemPressed: (screenName) {
        Navigator.of(context).pop();
        if (screenName == kMeals) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const TabsScreen()),
          );
        }
      }),
      body: Column(
        children: [
          SwitchListTile.adaptive(
            value: isGlutenFree,
            onChanged: (isChecked) => setState(() => isGlutenFree = isChecked),
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: kPaddingAll16,
          ),
        ],
      ),
    );
  }
}
