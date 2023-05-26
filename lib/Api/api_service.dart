import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:posts/models/user.dart';

class ApiService with ChangeNotifier{


  Future<void> register({required String firstName,required String secondName,required String email,required pictureUrl})async{
    final k =firstName;
    final response = await http.put(Uri.parse("https://posts-1f514-default-rtdb.firebaseio.com/users/$k.json"),
      body: json.encode({

      }
      ),
    );
  }

}