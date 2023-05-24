import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/posts.dart';
import '../screens/setting.dart';

class NavigationProvider with ChangeNotifier{
  int currentIndex=0;

  Widget navigation(int index){
    switch (index){
      case 0 : {
        return Home();
      }
      case 1 : {
        return AddPost();
      }
      case 2 :  {
        return Setting();
      }
    }
    return Home();
  }

  set setIndex(int index) {
    this.currentIndex = index;
    notifyListeners();
  }


}