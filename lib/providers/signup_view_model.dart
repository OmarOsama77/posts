import 'package:flutter/material.dart';

class signupViewModle with ChangeNotifier{
  bool validation(String password,String confirmPassword){
    if(password==confirmPassword){
      return true;
    }
    return false;
  }
}