import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.complex,
    required this.affordable,
    required this.onSelectMeal
  });

  final Meal meal;
  final Complexity complex ;
  final Affordability affordable;
  final void Function(Meal meal) onSelectMeal;


  String get complexityText{
    switch (complex){
      case Complexity.simple: return 'simple'; break;
      case Complexity.challenging: return 'challenging'; break;
      case Complexity.hard: return 'hard'; break;
      default: return 'unknown'; break;
    }
  }

  String get afford{
    switch (affordable){
      case Affordability.affordable: return 'affordable'; break;
      case Affordability.pricey: return 'pricey'; break;
      case Affordability.luxurious: return 'luxurious'; break;
      default: return 'unknown'; break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () => onSelectMeal(meal),
        child: Stack(
          children: [
            Center(
              child: FadeInImage(placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 44),
              color: Colors.black54,
              child: Column(
                children: [
                  Text(meal.title,
                    textAlign: TextAlign.center, maxLines: 2,
                    softWrap: true, overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 24,color: Colors.white, fontWeight: FontWeight.bold,),),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.schedule,color: Colors.white,),
                          const SizedBox(width: 6,),
                          Text('${meal.duration} min',style: const TextStyle(
                            color: Colors.white
                          ),)
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.work,color: Colors.white),
                          const SizedBox(width: 6,),
                          Text(complexityText,style: const TextStyle(
                              color: Colors.white
                          ),)
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.monetization_on_outlined,color: Colors.white),
                          const SizedBox(width: 6,),
                          Text(afford,style: const TextStyle(
                              color: Colors.white
                          ),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
