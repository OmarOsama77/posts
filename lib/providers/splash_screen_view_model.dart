import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SplashViewModel with ChangeNotifier{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser {
    return firebaseAuth.currentUser;
  }
      void navigation(BuildContext  context)async{
       if(currentUser == null){
         await Future.delayed(Duration(seconds: 5));
         Navigator.pushReplacementNamed(context, "/login");
       }else{
         await Future.delayed(Duration(seconds: 5));
         Navigator.pushReplacementNamed(context, "/bottom_navigation_bar");
       }
      }


}