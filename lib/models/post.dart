class Post{
 late String userName;
 late String title;
 late String imageUrl;

  Post({
    required this.userName,
    required this.title,
    required this.imageUrl});

   Map<String,dynamic>toMap(){
     return {
       "username":userName,
       "title":title,
       "imageUrl":imageUrl
     };
   }

}