import 'package:flutter/material.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/models/user.dart';

import '../models/post.dart';

class PostsViewModel with ChangeNotifier{

 ApiService apiService = ApiService();
  List<Post> posts=[];
  Future<List<Post>> fetchPosts()async{
  await  apiService.getPosts();
    posts = apiService.allPosts;
notifyListeners();
  print("post ${posts.length}");
   return posts;
  }



}