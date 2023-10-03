import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/bottom_nav_bar_provider.dart';

class BottomNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<NavigationProvider>(context);
    return Scaffold(
      body: Consumer<NavigationProvider>(
        builder: (_, viewModel, child) {
          return viewModel.navigation(viewModel.currentIndex);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: data.currentIndex,
          onTap: (index) {
            data.setIndex = index;
          },
          items: [
            BottomNavigationBarItem(
                icon: data.currentIndex == 0
                    ? Image.asset(
                  "assets/home_highlighted.png",
                  width: 25,
                )
                    : Image.asset(
                  "assets/home_blank.png",
                  width: 25,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: data.currentIndex == 1
                    ?
                Image.asset(
                  "assets/post choosen.png",
                  width: 25,
                ):Image.asset(
                  "assets/addPostIcon.png",
                  width: 25,
                )
                ,
                label: ""),
            BottomNavigationBarItem(icon: data.currentIndex == 2
                ? Image.asset(
              "assets/settings_high.png",
              width: 25,
            )
                : Image.asset(
              "assets/settings_blank.png",
              width: 25,
            ), label: ""),
          ]),
    );
  }
}
