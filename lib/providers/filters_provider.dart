import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meals_provider.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian
}

class FilterMealsNotifier extends StateNotifier<Map<Filter,bool>>{
  FilterMealsNotifier() : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegan: false,
    Filter.vegetarian: false,
  });

  void setFilter(Map<Filter, bool> chosenFilter ){
    state = chosenFilter;
  }

  void filters(Filter filter, bool active){
    state = {...state,filter: active};
  }

}

final filtersProvider = StateNotifierProvider<FilterMealsNotifier,Map<Filter,bool>>((ref) {
  return FilterMealsNotifier();
});

final filteredMealProvider = Provider((ref){
  final meals = ref.watch(mealsProvider);
  final activeFilter = ref.watch(filtersProvider);
  return meals.where((meal){
    if(activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if(activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if(activeFilter[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if(activeFilter[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});