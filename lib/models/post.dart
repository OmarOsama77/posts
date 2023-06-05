class Post{
 late String userName;
 late String title;
 late String imageUrl;
 late List<String> comments;
 late String userImage;

  Post({
    required this.userName,
    required this.title,
    required this.imageUrl,
    required this.comments,
    required this.userImage
  });

   Map<String,dynamic>toMap(){
     return {
       "username":userName,
       "title":title,
       "imageUrl":imageUrl,
       "comments":comments,
        "userImage":userImage
     };
   }

}