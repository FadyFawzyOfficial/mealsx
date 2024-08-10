import 'package:flutter/material.dart';
import 'package:mealsx/constants/strings.dart';

import '../constants/materials.dart';

class AppDrawer extends StatelessWidget {
  final void Function(String screenName) onDrawerItemPressed;

  const AppDrawer({super.key, required this.onDrawerItemPressed});

  @override
  Widget build(context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: kPaddingAll16,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.75),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_rounded,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                kSizedBoxWidth16,
                Text(
                  'Cooking up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          AppDrawerListTile(
            icon: Icons.restaurant_rounded,
            label: kMeals,
            onPressed: () => onDrawerItemPressed(kMeals),
          ),
          AppDrawerListTile(
            icon: Icons.settings_rounded,
            label: kFilters,
            onPressed: () => onDrawerItemPressed(kFilters),
          ),
        ],
      ),
    );
  }
}

class AppDrawerListTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const AppDrawerListTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      onTap: onPressed,
    );
  }
}
