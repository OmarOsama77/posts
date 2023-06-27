import 'dart:async';
import 'package:posts/models/post.dart';

import '../models/user.dart' as user;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:posts/Api/api_service.dart';


class SplashViewModel with ChangeNotifier {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  ApiService service = ApiService();


  User? get currentUser {
    return firebaseAuth.currentUser;
  }

  void nav2(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, "/login");
    });
  }

  user.User? userData;
  Future<user.User?> findUserByEmail(String uEmail) async {
    service.usersInfo.clear();
    await service.getUserData();
    for (int i = 0; i < service.usersInfo.length; i++) {
      if (uEmail == service.usersInfo[i].email) {
        userData = user.User(
            userId: service.usersInfo[i].userId,
            firstName: service.usersInfo[i].firstName,
            secondName: service.usersInfo[i].secondName,
            email: service.usersInfo[i].email,
            imageUrl: service.usersInfo[i].imageUrl) ;

        notifyListeners();
        print('User data ${userData!.email}');
        return userData;
      }
    }
  }





 Future<bool> autoLogin(BuildContext context,VoidCallback onSuccess )async{
    if(currentUser!=null){
      var user =await findUserByEmail(currentUser!.email.toString());
         if(user!=null){
            onSuccess();
             return true;
         }
    }else{

      return false;
    }
    return false;
 }



  List<Post> posts=[];
  Future<List<Post>> fetchPosts()async{
    posts.clear();
    await service.getPosts();
    posts = service.allPosts;
    notifyListeners();
    return posts;
  }



}
