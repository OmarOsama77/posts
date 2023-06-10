import 'package:flutter/material.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/models/user.dart';

class MyPostsViewModel with ChangeNotifier{
  User? userData;
  MyPostsViewModel(this.userData);
ApiService service = ApiService();
  void getuserPosts(){
      service.getUserPosts(userData!.userId.toString());
      print('hhh ${userData!.userId.toString()}');
  }
}