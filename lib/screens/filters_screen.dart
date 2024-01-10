import 'package:flutter/material.dart';
import 'package:meal/screens/tabs_screen.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilter});

  final Map<Filter,bool> currentFilter;


  @override
  State<FiltersScreen> createState() => _FiltersScreenState();

}

enum Filter{
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian
}

class _FiltersScreenState extends State<FiltersScreen> {


  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree = widget.currentFilter[Filter.glutenFree]!;
    _lactoseFree = widget.currentFilter[Filter.lactoseFree]!;
    _vegan = widget.currentFilter[Filter.vegan]!;
    _vegetarian = widget.currentFilter[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // drawer: MainDrawer(onSelectScreen: (id){
      //   if(id == 'meals'){
      //     Navigator.of(context).pop();
      //     Navigator.pushReplacement
      //       (context, MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //   }
      // },),
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop({
            Filter.glutenFree : _glutenFree,
            Filter.lactoseFree : _lactoseFree,
            Filter.vegan : _vegan,
            Filter.vegetarian : _vegetarian
          });
          return false;
        },
        child: Column(
          children: [
            customSwitch(context,"Gluten-Free",'Only include gluten-free meal',_glutenFree,
                    (bool v){
                  setState(() {
                    _glutenFree = v;
                  });
                }),
            customSwitch(context,"Lactose-Free",'Only include lactose-free meal',_lactoseFree,
                    (bool v){
                  setState(() {
                    _lactoseFree = v;
                  });
                }),
            customSwitch(context,"Vegan",'Only include vegan meal',_vegan,
                    (bool v){
                  setState(() {
                    _vegan = v;
                  });
                }),
            customSwitch(context,"Vegetarian",'Only include vegetarian meal',_vegetarian,
                    (bool v){
                  setState(() {
                    _vegetarian = v;
                  });
                }),
          ],
        ),
      ),
    );
  }

  SwitchListTile customSwitch(
      BuildContext context, String title, String subTitle, bool filter,
      Function(bool newVal) onChanged) {
    return SwitchListTile(
          title: Text(title,style: const TextStyle(
              color: Colors.white,fontSize: 24),),
          subtitle: Text(subTitle,style: const TextStyle(
              color: Colors.white,fontSize: 16),),
          value: filter,
          onChanged: onChanged,
          activeColor: Colors.red,
          contentPadding: const EdgeInsets.only(left: 34,right: 22),
        );
  }
}
