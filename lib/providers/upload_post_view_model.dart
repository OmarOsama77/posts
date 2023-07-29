import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posts/data/network/api_service.dart';
import 'package:posts/models/commets.dart';
import 'package:posts/models/post.dart';
import 'package:posts/models/user.dart';
import 'package:posts/providers/posts_view_model.dart';

class UploadPostViewModel with ChangeNotifier{
  User? user;
  UploadPostViewModel(this.user);
  ApiService service = ApiService();
  PickedFile? image;
  Uint8List? bytes;
  String? image64;
  String? postImage;
  Future<void> getImage()async{
    var picker = ImagePicker();
    image = await picker.getImage(source: ImageSource.gallery);
    notifyListeners();
  }
  void uploadPostImage(){
    if(image!.path.isNotEmpty){
      bytes = File(image!.path).readAsBytesSync();
      image64 = base64Encode(bytes!);
      postImage=image64!;
    }else{
      if(kDebugMode){
        print("null");
      }
    }
  }


  bool isThereImage(){
    if(image==null){
      return false;
    }
    return true;
  }

PostsViewModel postsViewModel = PostsViewModel();
  int statusCode=0;
  Future<int> sendPost (String userName,String title,String imageUrl,List<Comment> comment,String userImage,String userId) async {
   await service.uploadPost(
        post: Post(
            userName: userName,
            title: title,
            imageUrl: imageUrl,
            comments: comment,
            userImage: userImage,
            userId: userId,

        )
    );

      statusCode = service.uploadPostStat;
      notifyListeners();
   return statusCode;
  }

  bool isLoading=false;
    void toggleLoadingT(){
      isLoading=true;
      notifyListeners();
    }
  void toggleLoadingF(){
    isLoading=false;
    notifyListeners();
  }
}