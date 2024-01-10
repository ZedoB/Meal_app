import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal, required this.onSelectFav});

  final Meal meal;
  final void Function(Meal meal) onSelectFav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: () => onSelectFav(meal), icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl,height: 300,width: double.infinity,fit: BoxFit.cover,),
            const SizedBox(height: 14,),
            const Center(child: Text('Ingredients',style: TextStyle(color: Colors.red),)),
            const SizedBox(height: 14,),
            for(final i in meal.ingredients)
              Text(i,style: const TextStyle(color: Colors.black),),
            const SizedBox(height: 14,),
            const Center(child: Text('Steps',style: TextStyle(color: Colors.red),)),
            const SizedBox(height: 14,),
            for(final s in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(s,textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),),
              ),
          ],
        ),
      ),
    );
  }
}
