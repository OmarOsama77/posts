import 'package:flutter/material.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/models/post.dart';
import 'package:posts/providers/posts_view_model.dart';
import '../models/user.dart';


class HomeViewModel with ChangeNotifier{
  User?  user;
  HomeViewModel(this.user);


}