import 'package:flutter/material.dart';
import 'package:meal/screens/meal_detail_screen.dart';
import 'package:meal/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals, required this.onSelectFav});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onSelectFav;


  @override
  Widget build(BuildContext context) {
    return title == null? content(context) : Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content(context),
    );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meals.map((meal) => MealItem(meal: meal,
          complex: meal.complexity, affordable: meal.affordability,
        onSelectMeal: (Meal meal){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => MealDetailScreen(meal: meal,
                onSelectFav: onSelectFav,)));
        },)).toList(),
      ),
    );
  }
}