import 'package:flutter/material.dart';
import 'package:posts/data/network/api_service.dart';
import 'package:posts/models/post.dart';
import 'package:posts/models/user.dart';

class MyPostsViewModel with ChangeNotifier{
  User? userData;
  MyPostsViewModel(this.userData);
ApiService service = ApiService();
List<Post> userPosts=[];
  Future<List<Post>> findUserPosts(String userId)async{
    service.allPosts.clear();
    userPosts.clear();
    await service.getPosts();
    for(int i=0;i<service.allPosts.length;i++){
        if(userId == service.allPosts[i].userId){
          userPosts.add(service.allPosts[i]);
        }
    }

    print('userposts ${userPosts.length}');
    return userPosts;
  }
 int statusCode=0;
  Future<int> removePost(String postId)async{
  await service.deletePost(postId) ;
  statusCode = service.deletePostStatue;
  notifyListeners();
  print('sdasdOMAR ${statusCode}');
    return statusCode;
  }

}