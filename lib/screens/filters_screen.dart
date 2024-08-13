import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../widgets/switch_filter.dart';
// import '../widgets/app_drawer.dart';
// import 'tabs_screen.dart';

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
      // drawer: AppDrawer(onDrawerItemPressed: (screenName) {
      //   Navigator.of(context).pop();
      //   if (screenName == kMeals) {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (context) => const TabsScreen()),
      //     );
      //   }
      // }),
      body: Column(
        children: [
          SwitchFilter(
            value: isGlutenFree,
            onChanged: (isChecked) => setState(() => isGlutenFree = isChecked),
            title: 'Gluten-free',
            subTitle: 'Only include gluten-free meals.',
          )
        ],
      ),
    );
  }
}
