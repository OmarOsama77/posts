import 'package:flutter/material.dart';
import 'package:posts/data/network/api_service.dart';


import '../models/post.dart';

class PostsViewModel with ChangeNotifier {
  ApiService apiService = ApiService();
  List<Post> posts = [];



  Future<List<Post>> fetchPosts() async {
    posts.clear();
    await apiService.getPosts();
    posts = apiService.allPosts;
    notifyListeners();
    return posts;
  }


}
