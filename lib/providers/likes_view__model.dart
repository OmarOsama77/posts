import 'package:flutter/material.dart';
import 'package:posts/Api/api_service.dart';

class LikedViewModel with ChangeNotifier{
  ApiService service = ApiService();
  bool isLiked=false;

  void toogleLiked(){
    isLiked=!isLiked;
   notifyListeners();
  }

     Future <void> addLike(String postId,String userId)async{
      await service.addLike(postId, userId);
    }

}