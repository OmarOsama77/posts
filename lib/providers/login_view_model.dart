import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/providers/authentication_view_model.dart';

import '../Api/api_service.dart';
import '../models/user.dart';

class LoginViewModel with ChangeNotifier {
  ApiService service = ApiService();
  AuthenticationViewModel authVM = AuthenticationViewModel();
   User? userData;

  Future<User?> findUserByEmail(String uEmail) async {
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
        print('User data ${userData!.email}');
        return userData;
        break;
      }
      }
    }

  void forgotPass(String email){
    authVM.forgetPass(email);
  }


  bool isLoading = false;
  void toogleLoading(){
    isLoading = !isLoading;
    notifyListeners();

  }

}
