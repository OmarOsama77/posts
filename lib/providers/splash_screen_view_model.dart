import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/providers/login_view_model.dart';

class SplashViewModel with ChangeNotifier {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  ApiService service = ApiService();



  User? get currentUser {
    return firebaseAuth.currentUser;
  }

  void nav(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, "/bottom_navigation_bar");
    });
  }
  void nav2(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, "/login");
    });
  }

  LoginViewModel loginViewModel = LoginViewModel();


}
