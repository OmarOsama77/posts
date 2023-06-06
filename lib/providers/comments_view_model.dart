
import 'package:flutter/material.dart';
import 'package:posts/Api/api_service.dart';

import '../models/commets.dart';

class CommentsViewModel with ChangeNotifier{
  ApiService service = ApiService();
  void addComment(String postId){
      service.uploadComment(postId);
}
}