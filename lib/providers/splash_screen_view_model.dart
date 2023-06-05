import 'dart:async';

import 'package:flutter/material.dart';
import '../models/post.dart';
import '../models/user.dart' as user;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/providers/login_view_model.dart';

class SplashViewModel with ChangeNotifier {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  ApiService service = ApiService();

//
// List<Post> posts=[];
//    Future <List<Post>> fetchPosts ()async{
//     await service.getPosts();
//     for(int i=0;i<service.allPosts.length;i++){
//       posts.add(service.allPosts[i]);
//     }
//     print("posts lenght ${posts.length}");
//     return posts;
//    }

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
