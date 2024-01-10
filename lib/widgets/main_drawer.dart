import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.red,Colors.red.withOpacity(.8)
            ])
          ),
          child: const Row(
            children: [
              Icon(Icons.fastfood,size: 48, color: Colors.white,),
              SizedBox(width: 18,),
              Text("Cooking up",style: TextStyle(color: Colors.white,fontSize: 24),)
            ],
          ),),
          ListTile(
            title: const Text("Meals",style: TextStyle(
                color: Colors.black,fontSize: 24),),
            leading: const Icon(Icons.restaurant,color: Colors.black,),
            onTap:(){
              onSelectScreen('meal');
            },
          ),
          ListTile(
            title: const Text("Filters",style: TextStyle(
                color: Colors.black,fontSize: 24),),
            leading: const Icon(Icons.settings,color: Colors.black,),
            onTap:(){
              onSelectScreen('filter');
            },
          )
        ],
      )
    );
  }
}
