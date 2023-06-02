import 'package:flutter/material.dart';
import 'package:posts/Api/api_service.dart';

import '../models/user.dart';

class LoginViewModel with ChangeNotifier{
  ApiService service = ApiService();

  void findUserByEmail (String uEmail)async{
     await service.getUserData();
    List<User> userData=[];
        print("uuuu ${service.usersInfo.length}");
      for(int i=0;i<service.usersInfo.length;i++){
        print("Entered email ${uEmail}");
        print("service email ${service.usersInfo[i].email}");
        if(uEmail == service.usersInfo[i].email){
          userData.add(service.usersInfo[i]);
        }
      }
      print("user l ${userData.length}");
      if(userData.length>0){
        print("User Information ${userData[0].email} ${userData[0].firstName}");
      }
  }
}