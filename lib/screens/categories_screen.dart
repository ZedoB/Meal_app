import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/widgets/category_grid_item.dart';

import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onSelectFav, required this.availableMeal});

  final void Function(Meal meal) onSelectFav;
  final List<Meal> availableMeal;

  @override
  Widget build(BuildContext context) {
    return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,crossAxisSpacing: 20,
            childAspectRatio: 3/2
          ),
        children: [
          for(final category in availableCategories)
            CategoryGridItem(category: category, onSelectFav: onSelectFav,
            availableMeal: availableMeal,)
        ]
    );
  }
}
