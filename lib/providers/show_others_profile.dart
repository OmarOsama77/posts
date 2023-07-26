import 'package:flutter/material.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/models/post.dart';
import 'package:posts/models/user.dart';
import 'package:posts/providers/user_view_model.dart';

class ShowOthersProfileVM extends ChangeNotifier {
  ApiService service = ApiService();
  UserViewModel userViewModel = UserViewModel();
   late User user;

  Future<User> getUserData(String userId) async {
    service.usersInfo.clear();
    await service.getUserData();
    for (int i = 0; i < service.usersInfo.length; i++) {
      if (userId == service.usersInfo[i].userId) {
        user = User(firstName: service.usersInfo[i].firstName,
            secondName: service.usersInfo[i].secondName,
            email: service.usersInfo[i].email,
            imageUrl: service.usersInfo[i].imageUrl);
      }
    }
    return user;
  }
  List<Post> userPosts=[];
  Future<List<Post>> getUserPosts(String userId)async{
    userPosts.clear();
    service.allPosts.clear();
    await service.getPosts();
    await userViewModel.getUsers();
    int index=0;
    for (int i=0;i<service.allPosts.length;i++){
      if(service.allPosts[i].userId == userId){
        String userName = userViewModel.getUserNameById(userId);
        print('map ${userViewModel.users}');
        service.allPosts[i].userName = userName;
        print('name ${ service.allPosts[i].userName}');
        userPosts.add(service.allPosts[i]);
      }
    }

    return userPosts;
  }
}