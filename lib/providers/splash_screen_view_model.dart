import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart'as http;
import 'package:posts/Api/api_constants.dart';
import 'package:posts/Api/api_service.dart';

import '../screens/navigation/bottom_navigation_bar.dart';




class SplashViewModel with ChangeNotifier{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
 ApiService service = ApiService();

  User? get currentUser {
    return firebaseAuth.currentUser;
  }
      bool checkAutoLogin(BuildContext  context){
       if(currentUser != null){
         return true;
       }
       return false;
      }

  void fetchPosts (){
    service.getPosts();
  }

}





















