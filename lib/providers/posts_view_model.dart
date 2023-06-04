import 'package:flutter/material.dart';

import '../models/post.dart';

class PostsViewModel with ChangeNotifier{
  List<Post> allPosts=[];
  void getposts(){
    print("lenght ${allPosts.length}");
  }
}