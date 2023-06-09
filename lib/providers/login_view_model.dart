import 'package:flutter/material.dart';
import 'package:posts/Api/api_service.dart';

import '../models/user.dart';

class LoginViewModel with ChangeNotifier {
  ApiService service = ApiService();
   User? userData;

  Future <void> findUserByEmail(String uEmail) async {
    service.usersInfo.clear();
    await service.getUserData();
    for (int i = 0; i < service.usersInfo.length; i++) {
      if (uEmail == service.usersInfo[i].email) {
        userData = User(
            userId: service.usersInfo[i].userId,
            firstName: service.usersInfo[i].firstName,
            secondName: service.usersInfo[i].secondName,
            email: service.usersInfo[i].email,
            imageUrl: service.usersInfo[i].imageUrl);
      notifyListeners();
        break;
      }else{
        print('User not found');
      }
      }
    }


}
