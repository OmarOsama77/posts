import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/bottom_nav_bar_provider.dart';


class BottomNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final data = Provider.of<NavigationProvider>(context);
    return Scaffold(
      body: Consumer<NavigationProvider>(builder: (_,viewModel,child){
          return viewModel.navigation(viewModel.currentIndex);
      },) ,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: data.currentIndex,
          onTap: (index){
            data.setIndex=index;
          },
          items: [
              BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon:Icon(Icons.add),label: "Post"),
              BottomNavigationBarItem(icon:Icon(Icons.settings),label: "Settings"),
          ]),
    );
  }
}
