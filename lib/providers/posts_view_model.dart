import 'package:flutter/material.dart';

import '../models/post.dart';

class PostsViewModel with ChangeNotifier{
  List<Post> allPosts=[];
  void getposts(){
    print("Posts lenght ${allPosts.length}");
  }

  List<Post> updates=[];
  void addPost(String userName,String title,String imageUrl,List<String> comments){
  print("before ${updates.length}");
    updates.add(Post(userName: userName, title: title, imageUrl: imageUrl, comments: comments));
  print("after ${updates.length}");
  }
 void update(){
    for(int i=0;i<updates.length;i++){
      allPosts.add(updates[i]);
    }

 }
}