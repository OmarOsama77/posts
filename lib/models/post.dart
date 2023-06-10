import 'package:posts/models/commets.dart';

class Post{
 late String? postId;
 // late String userId;
 late String userName;
 late String title;
 late String imageUrl;
 List<Comment>? comments;
 late String userImage;

  Post({
    required this.userName,
    required this.title,
    required this.imageUrl,
    required this.comments,
    required this.userImage,
    // required this.userId,
     this.postId,
  });

   Map<String,dynamic>toMap(){
     return {
       "username":userName,
       "title":title,
       "imageUrl":imageUrl,
       "comments":comments,
        "userImage":userImage,
        // "PostId":postId,
       // "userId":userId
     };
   }

}