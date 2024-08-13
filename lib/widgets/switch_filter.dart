import 'package:flutter/material.dart';
import 'package:mealsx/constants/materials.dart';

class SwitchFilter extends StatelessWidget {
  final bool value;
  final void Function(bool) onChanged;
  final String title;
  final String subTitle;

  const SwitchFilter({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(context) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: kPaddingAll16,
    );
  }
}
