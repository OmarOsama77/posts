import 'package:flutter/material.dart';
import 'package:posts/data/network/api_service.dart';


import '../models/post.dart';
import 'package:posts/models/user.dart';
class PostsViewModel with ChangeNotifier {
  ApiService apiService = ApiService();
  List<Post> posts = [];
  bool dataLoad=false;


  Future<List<Post>> fetchPosts(String userId) async {
    posts.clear();
    await apiService.getPosts();

    for (int i=0;i<apiService.allPosts.length;i++){
      if(apiService.allPosts[i].userId==userId){
        continue;
      }else{
        posts.add(  apiService.allPosts[i]);
      }
    }
    dataLoad=true;
    notifyListeners();
    return posts;
  }


}
