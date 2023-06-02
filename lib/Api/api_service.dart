import 'package:http/http.dart'as http;
import 'package:posts/Api/api_constants.dart';
import 'package:posts/models/post.dart';
import 'dart:convert';
import 'package:posts/models/user.dart';

class ApiService{

    Future<void> register({required User user})async{
    var bodyR = user?.toMap();
    final url = Uri.https("${ApiConstants.BaseUrl}","/users.json");
    final response =await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(bodyR)
    );
    print('status code  =  ${response.statusCode}');
    print("object ${response.body}");
  }



  Future<void> uploadPost({Post? post})async {
    var bodyR = post?.toMap();
    final url = Uri.https("${ApiConstants.BaseUrl}", "/Posts.json");
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(bodyR)
    );
    print("Post response status code ${response.statusCode}");

  }

    List<Post> allPosts=[];
    Future<List<Post>> getPosts ()async{
     try{
       final url = Uri.https("${ApiConstants.BaseUrl}","/Posts.json");
       final response =await http.get(url);
       final Map<String,dynamic> posts = jsonDecode(response.body);
       allPosts.clear();
       posts.forEach((key, value) {
         final post = Post(userName: value["username"], title: value["title"], imageUrl: value["imageUrl"], comments: List<String>.from(value["comments"]));
         allPosts.add(post);
       });
       print("Retrived ${allPosts.length} posts");
       return allPosts;
     }catch(e){
       print("Error $e");
     }
     return [];
    }

    List<User> usersInfo= [];
    Future<List<User>> getUserData()async{
    try{
      final url = Uri.https("${ApiConstants.BaseUrl}","/users.json");
      final response =await http.get(url);
      final Map<String,dynamic> user = jsonDecode(response.body);
      user.forEach((key, value) {
        final userData = User(firstName: value["firstName"], secondName: value["secondName"], email: value["email"], imageUrl: value["imageUrl"]);
        usersInfo.add(userData);
      });
      print("object ${usersInfo}");
      print("got ${usersInfo.length} users");
      return usersInfo;
    }catch(e){
      print("Error fetching users data $e");
    }
    return [];
   }


}