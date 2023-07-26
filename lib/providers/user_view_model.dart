import 'package:flutter/material.dart';

import '../Api/api_service.dart';

class UserViewModel with ChangeNotifier{
  ApiService apiService = ApiService();
  Map<String,String> users={};
  Future<Map<String,String>> getUsers()async{
    await apiService.getUserData();
    for (int i=0;i<apiService.usersInfo.length;i++){
      users.addAll({
        "${apiService.usersInfo[i].userId}":"${apiService.usersInfo[i].firstName} ${apiService.usersInfo[i].secondName}"
      });
    }
    print('users in the map ${users}');
    return users;
  }
  String getUserNameById(String userId) {
    return users[userId] ?? "";
  }
}