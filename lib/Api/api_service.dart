
import 'package:http/http.dart'as http;
import 'package:posts/Api/api_constants.dart';
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



  Future<void> uploadPost()async{

  }
}