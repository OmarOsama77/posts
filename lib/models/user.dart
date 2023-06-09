class User{
 String? userId;
 late String firstName;
 late String secondName;
 late String email;
 late String imageUrl;
  User(
      {
        this.userId,
        required this.firstName,
        required this.secondName,
        required this.email,
        required this.imageUrl,
      });
      Map<String , dynamic >toMap(){
        return {
          "firstName":firstName,
          "secondName":secondName,
          "email":email,
          "imageUrl":imageUrl,
        };
      }
}