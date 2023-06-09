import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/models/user.dart';
import 'package:posts/providers/authentication_view_model.dart';
import 'package:posts/providers/login_view_model.dart';

class SettingViewModel with ChangeNotifier{
 User? user;
 SettingViewModel(this.user);

ApiService service = ApiService();
AuthenticationViewModel viewModel = AuthenticationViewModel();
  void updataFirstName(String fieldToBeUpdated,String firstName)async{
    service.updataUserData(fieldToBeUpdated, user!.userId.toString(),firstName);
   user!.firstName = firstName;
    print('hhh ${user!.firstName}');
    notifyListeners();
  }
 void updataSecondName(String fieldToBeUpdated,String secondName)async{
   service.updataUserData(fieldToBeUpdated, user!.userId.toString(), secondName);
   user!.secondName = secondName;
   print('hhh2 ${user!.secondName}');
   notifyListeners();
 }
  void changePassword(String newPass, String confirmPass)async{
    if(newPass==confirmPass){
     await viewModel.updatePassword(newPass);
    }else{
      Fluttertoast.showToast(msg: "Try again");
    }
  }
  void deleteAccount()async{
    await viewModel.deleteAccount();
      service.deleteUserData(user!.userId.toString());
  }


}