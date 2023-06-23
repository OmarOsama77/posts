
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posts/Api/api_service.dart';
import 'package:uuid/uuid.dart';
import '../models/commets.dart';
import '../models/user.dart';

class CommentsViewModel with ChangeNotifier{
  User? user;

  CommentsViewModel(this.user);

  ApiService service = ApiService();


 String generateCommentId(){
   var uuid = Uuid();
   return uuid.v4();
 }

  void addComment(String postId,Comment comment){
      service.uploadComment(postId, comment);
  }
  List<Comment> comments=[];
  Future<List<Comment>> fetchComments(String postId) async {

      final retrievedComments = await service.getComments(postId);
      comments = retrievedComments;
      notifyListeners();

       return comments;
  }
}

