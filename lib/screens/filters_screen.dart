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
  final Map<Filter, bool> mealsFilter;

  const FiltersScreen({super.key, required this.mealsFilter});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late Map<Filter, bool> mealsFilter;

  @override
  void initState() {
    super.initState();
    mealsFilter = widget.mealsFilter;
  }

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
          Navigator.of(context).pop(mealsFilter);
        },
        child: Column(
          children: [
            SwitchFilter(
              value: mealsFilter[Filter.glutenFree]!,
              onChanged: (isChecked) =>
                  setState(() => mealsFilter[Filter.glutenFree] = isChecked),
              title: 'Gluten-free',
              subTitle: 'Only include gluten-free meals.',
            ),
            SwitchFilter(
              value: mealsFilter[Filter.lactoseFree]!,
              onChanged: (isChecked) =>
                  setState(() => mealsFilter[Filter.lactoseFree] = isChecked),
              title: 'Lactose-free',
              subTitle: 'Only include lactose-free meals.',
            ),
            SwitchFilter(
              value: mealsFilter[Filter.vegetarian]!,
              onChanged: (isChecked) =>
                  setState(() => mealsFilter[Filter.vegetarian] = isChecked),
              title: 'Vegetarian',
              subTitle: 'Only include vegetarian meals.',
            ),
            SwitchFilter(
              value: mealsFilter[Filter.vegan]!,
              onChanged: (isChecked) =>
                  setState(() => mealsFilter[Filter.vegan] = isChecked),
              title: 'Vegan',
              subTitle: 'Only include vegan meals.',
            ),
          ],
        ),
      ),
    );
  }
}
