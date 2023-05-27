import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:posts/Api/api_constants.dart';
import 'dart:convert';

import 'package:posts/models/user.dart';

class ApiService{


    Future<void> register({required User user,required String firstName})async{
      var bodyR = user?.toMap();
    print('Body $bodyR');
    final response = await http.put(Uri.parse("${ApiConstants.BaseUrl}/users/$firstName.json"),
    body: bodyR);
  }

}