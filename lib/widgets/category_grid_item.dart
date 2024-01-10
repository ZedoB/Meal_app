import 'package:flutter/material.dart';
import 'package:meal/screens/meals_screen.dart';
import 'package:meal/data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectFav,
    required this.availableMeal});

  final Category category;
  final void Function(Meal meal) onSelectFav;
  final List<Meal> availableMeal;


  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: (){
          final filteredMeal = availableMeal.where(
                  (meal) => meal.categories.contains(category.id)
          ).toList();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => MealsScreen(
                title: category.title, meals: filteredMeal, onSelectFav: onSelectFav,
              )
          ));
        },
        splashColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [category.color.withOpacity(.54),category.color.withOpacity(.9)],
              begin: Alignment.topLeft, end: Alignment.bottomRight
            )
          ),
          child: Center(
            child: Text(category.title,style: const TextStyle(
              fontSize: 24,fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ),
    );
  }
}
