import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/providers/filters_provider.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meals_screen.dart';
import '../models/meal.dart';
import '../providers/favourites_provider.dart';
import '../widgets/main_drawer.dart';



class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {

  int _selectedPageIndex = 0;

  void _setScreen(String id){
    if(id == 'filter'){
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealProvider);

    Widget activePage = CategoriesScreen(availableMeal: availableMeals);
    var activePageTitle = 'Categories';
    if(_selectedPageIndex == 1){
      final List<Meal> favMeal = ref.watch(favouritesProvider);
      activePage = MealsScreen(meals: favMeal);
      activePageTitle = 'Favourites';
    }

    return Scaffold(
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites')
        ],
      ),
    );
  }
}
