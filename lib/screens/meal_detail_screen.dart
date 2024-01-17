import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/providers/favourites_provider.dart';
import '../models/meal.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> favouritesMeals = ref.watch(favouritesProvider);
    final bool isFav = favouritesMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
            final added = ref.read(favouritesProvider.notifier).favStatusToggle(meal);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(added ? "Added" : "Removed")));

    }, icon: isFav? Icon(Icons.star) : Icon(Icons.star_border),
          color: Colors.amber,)
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
