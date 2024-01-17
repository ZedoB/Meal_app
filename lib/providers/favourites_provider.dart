import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavMealsNotifier extends StateNotifier<List<Meal>>{
  FavMealsNotifier() : super([]);

  bool favStatusToggle(Meal meal){
    final isExist = state.contains(meal);
    if(isExist) {
        state = state.where((element) => element.id != meal.id).toList();
    return false;}
    else {
      state = [...state,meal];
    return true;}
  }

}

final favouritesProvider = StateNotifierProvider<FavMealsNotifier,List<Meal>>((ref) {
  return FavMealsNotifier();
});