import 'package:http/http.dart'as http;

import 'package:posts/data/network/api_constants.dart';
import 'package:posts/models/commets.dart';
import 'package:posts/models/post.dart';
import 'dart:convert';
import 'package:posts/models/user.dart';


class ApiService{
    int registerStatusCode=0;
    Future<void> register({required User user})async{
    var bodyR = user?.toMap();
    final url = Uri.https("${ApiConstants.BaseUrl}","/users/.json");
    final response =await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(bodyR)
    );
    registerStatusCode = response.statusCode;
    print('status code  =  ${response.statusCode}');

  }


int uploadPostStat=0;
  Future<void> uploadPost({Post? post})async {
    var bodyR = post?.toMap();

    final url = Uri.https("${ApiConstants.BaseUrl}", "/Posts.json");
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(bodyR)
    );
    print("Post response status code ${response.statusCode}");
    uploadPostStat = response.statusCode;

  }

  List<String> likes=[];
    Future<void> addLike(String postId,String userId)async{
      try{
        final url = Uri.https("${ApiConstants.BaseUrl}", "/Posts/$postId/likes.json");
        var response =await http.put(url,body: jsonEncode(
          {
            userId:true
          }
        ));
        if(response.statusCode==200){
          print('res ${response}');
          print('res ${response.statusCode}');
      }else{
          print('not done');
      }
      }catch(e){
        print('Error in likes');
      throw e;
      }



  }

  Future<void> uploadComment(String postId,Comment comment)async{
    var bodyR= comment.toMap();
      final response =await http.put(Uri.parse("https://${ApiConstants.BaseUrl}/Posts/$postId/comments/${comment.id}/.json"),
    body: jsonEncode(bodyR)
    );
print("Hello ${response.statusCode}");
    }



    void updataUserData(String fieldToBeUpdated,String userId,String update)async{
      final response =await http.put(Uri.parse("https://${ApiConstants.BaseUrl}/users/$userId/$fieldToBeUpdated/.json"),
      body: jsonEncode(update),
      );
      print('In update user data ${response.statusCode}');
    }




    List<Comment>allComments=[];
    Future<List<Comment>>getComments(String postId)async{
      try{
        final url = Uri.https("${ApiConstants.BaseUrl}","/Posts/$postId/comments.json");
        final response =await http.get(url);
        final Map<String,dynamic> commentsData = jsonDecode(response.body);
        allComments.clear();
        commentsData.forEach((key, value) {
          var data = Comment(userImage: value["userImage"], title: value["title"], userName: value["userName"]);
          allComments.add(data);
        });

        print("succes getting comments ${allComments.length}");
        return allComments;
      }catch(e){
          return [];

    }

    }

    List<Post> allPosts=[];
    Future<List<Post?>?> getPosts ()async{
     try{
       final url = Uri.https(ApiConstants.BaseUrl,"/Posts.json");
       final response =await http.get(url);
       print('status code ${response.statusCode}');
      final Map<String,dynamic> posts = jsonDecode(response.body);
       allPosts.clear();
      if(posts.length==0){
         print('In posts Equal 0');
         return allPosts;
      }
       posts.forEach((key, value) {
        final post = Post(
            postId: key,
            title: value["title"],
            imageUrl: value["imageUrl"],
            comments:[],
            userImage: value["userImage"],
            userId: value["userId"],

        );
         allPosts.add(post);
       });
       return allPosts;
     }catch(e){
       print("Error in posts $e");
       return allPosts;
     }

    }






    List<User> usersInfo= [];
    Future<List<User>> getUserData()async{
    try{
      usersInfo.clear();
      final url = Uri.https("${ApiConstants.BaseUrl}","/users.json");
      final response =await http.get(url);
      final Map<String,dynamic> user = jsonDecode(response.body);
      user.forEach((key, value) {
        final userData =User(userId: key,firstName: value["firstName"], secondName: value["secondName"], email: value["email"], imageUrl: value["imageUrl"]);
        usersInfo.add(userData);
      });

      print("got ${usersInfo.length} users");

      return usersInfo;
    }catch(e){
      print("Error fetching users data $e");
    }
    return [];
   }






   void deletedUserPosts(String userId)async {
    await getPosts();
    for (int i=0;i<allPosts.length;i++){
        if(userId==allPosts[i].userId){
          final response =await http.delete(Uri.parse("https://${ApiConstants.BaseUrl}/Posts/${allPosts[i].postId}.json"));
          print('Post dElete ${response.statusCode}');
      }
      }
    }

    void deleteUserData(String userId)async{
    final response =await http.delete(Uri.parse("https://${ApiConstants.BaseUrl}/users/$userId.json"));
      print('Delete user data ${response.statusCode}');
    }






int deletePostStatue=0;
  Future<int> deletePost(String postId)async{
      final respnse = await http.delete(Uri.parse("https://${ApiConstants.BaseUrl}/Posts/$postId.json"));
      print('delete post response = ${respnse.statusCode}');
      deletePostStatue = respnse.statusCode;
      return respnse.statusCode;
  }





}