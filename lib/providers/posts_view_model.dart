import 'package:flutter/material.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/models/user.dart';

import '../models/post.dart';

class PostsViewModel with ChangeNotifier{

 ApiService apiService = ApiService();
  List<Post> posts=[];
  Future<List<Post>> fetchPosts()async{
    posts.clear();
  await  apiService.getPosts();
    posts = apiService.allPosts;
    print('post lenght${apiService.allPosts.length}');
    notifyListeners();
    print("object ${posts[0].title}");
    print("object ${posts[0].postId}");
   return posts;
  }



}