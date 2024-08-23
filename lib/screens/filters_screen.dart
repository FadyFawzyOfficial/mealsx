import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/strings.dart';
import '../providers/filter_provider.dart';
import '../widgets/switch_filter.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(context, ref) {
    final filters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text(kFilters)),
      body: Column(
        children: [
          SwitchFilter(
            value: filters[Filter.glutenFree]!,
            onChanged: (isChecked) => ref
                .read(filterProvider.notifier)
                .filter(Filter.glutenFree, isChecked),
            title: 'Gluten-free',
            subTitle: 'Only include gluten-free meals.',
          ),
          SwitchFilter(
            value: filters[Filter.lactoseFree]!,
            onChanged: (isChecked) => ref
                .read(filterProvider.notifier)
                .filter(Filter.lactoseFree, isChecked),
            title: 'Lactose-free',
            subTitle: 'Only include lactose-free meals.',
          ),
          SwitchFilter(
            value: filters[Filter.vegetarian]!,
            onChanged: (isChecked) => ref
                .read(filterProvider.notifier)
                .filter(Filter.vegetarian, isChecked),
            title: 'Vegetarian',
            subTitle: 'Only include vegetarian meals.',
          ),
          SwitchFilter(
            value: filters[Filter.vegan]!,
            onChanged: (isChecked) => ref
                .read(filterProvider.notifier)
                .filter(Filter.vegan, isChecked),
            title: 'Vegan',
            subTitle: 'Only include vegan meals.',
          ),
        ],
      ),
    );
  }
}
