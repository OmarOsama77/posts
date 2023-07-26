import 'package:flutter/material.dart';

class LikedViewModel with ChangeNotifier{
  bool isLiked=false;

  void toogleLiked(){
    isLiked=!isLiked;
   notifyListeners();

  }
}