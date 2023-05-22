import 'package:flutter/material.dart';


class RegisterViewModel with ChangeNotifier{
  bool checkPasswordVal(String password,String confirmPass){
    int x  = password.compareTo(confirmPass);
    if(x==0){
      return true;
    }
    return false;
  }

    notifyListeners();
}