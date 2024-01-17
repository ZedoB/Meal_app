import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/providers/filters_provider.dart';


class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          customSwitch(context,"Gluten-Free",'Only include gluten-free meal',
              activeFilters[Filter.glutenFree]!,
                  (bool v){
            ref.read(filtersProvider.notifier).filters(Filter.glutenFree, v);
              }),
          customSwitch(context,"Lactose-Free",'Only include lactose-free meal',
              activeFilters[Filter.lactoseFree]!,
                  (bool v){
            ref.read(filtersProvider.notifier).filters(Filter.lactoseFree, v);
                  }),
          customSwitch(context,"Vegan",'Only include vegan meal',
              activeFilters[Filter.vegan]!,
                  (bool v){
            ref.read(filtersProvider.notifier).filters(Filter.vegan, v);
                  }),
          customSwitch(context,"Vegetarian",'Only include vegetarian meal',
              activeFilters[Filter.vegetarian]!,
                  (bool v){
            ref.read(filtersProvider.notifier).filters(Filter.vegetarian, v);
                  }),
        ],
      ),
    );
  }

  SwitchListTile customSwitch(
      BuildContext context, String title, String subTitle, bool filter,
      Function(bool newVal) onChanged) {
    return SwitchListTile(
          title: Text(title,style: const TextStyle(
              color: Colors.white,fontSize: 24),),
          subtitle: Text(subTitle,style: const TextStyle(
              color: Colors.white,fontSize: 16),),
          value: filter,
          onChanged: onChanged,
          activeColor: Colors.red,
          contentPadding: const EdgeInsets.only(left: 34,right: 22),
        );
  }
}
