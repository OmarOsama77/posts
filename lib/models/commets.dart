import 'package:posts/models/user.dart';

class Comment{
  String? userImage;
  String? title;
  String? userName;
  String? id;

  Comment({required this.userImage,required this.title,required this.userName,this.id});


  Map<String,dynamic> toMap(){
    return {
      "userImage":userImage,
      "title":title,
      "userName":userName
    };
}
}