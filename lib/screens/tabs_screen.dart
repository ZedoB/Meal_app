import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meals_screen.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPageIndex = 0;
  final List<Meal> _favMeal = [];
  Map<Filter,bool> _selectedFilter = kInitialFilter;

  void _showInfoMsg(String msg){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _setScreen(String id){
    if(id == 'filter'){
      Navigator.of(context).pop();
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => FiltersScreen(
        currentFilter: _selectedFilter
      ))).then((value) => setState(()=>_selectedFilter = value ?? kInitialFilter));
    }
  }

  void _favStatusToggle(Meal meal){
    final isExist = _favMeal.contains(meal);
    if(isExist) {
      setState(() {
        _favMeal.remove(meal);
      });
      _showInfoMsg("Deleted");
    }
    else {
      setState(() {
          _favMeal.add(meal);
        });
      _showInfoMsg("Added");
    }
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final availableMeals = dummyMeals.where((meal){
      if(_selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if(_selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if(_selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if(_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(onSelectFav: _favStatusToggle, availableMeal: availableMeals);
    var activePageTitle = 'Categories';
    if(_selectedPageIndex == 1){
      activePage = MealsScreen(meals: _favMeal, onSelectFav: _favStatusToggle,);
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
