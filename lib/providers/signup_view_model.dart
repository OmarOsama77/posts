import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posts/models/user.dart';
import 'package:posts/data/network/api_service.dart';

class SignupViewModel with ChangeNotifier{
  ApiService service  = ApiService();
  SignupViewModel(this.service);
  bool passwordObsecure=true;
  bool confirmPasswordObsecure = true;
  bool validation(String password,String confirmPassword){
    if(password==confirmPassword){
      return true;
    }
    return false;
  }
  PickedFile? image;
  Uint8List? bytes;
  String? image64;
  String? userImage;
  Future<void> getImage()async{
    var picker = ImagePicker();
    image = await picker.getImage(source: ImageSource.gallery);
    notifyListeners();
  }
  void uploadUserImage(){
    if(image!.path.isNotEmpty){
      bytes = File(image!.path).readAsBytesSync();
      image64 = base64Encode(bytes!);
      userImage=image64!;
    }else{
      if(kDebugMode){
        print("null");
      }
    }
  }


  bool isThereImage(){
    if(image==null){
      return false;
    }
    return true;
  }

int signUpRes=0;
  void uploadUserData(String firstName , String secondName , String email,String imageUrl){
    service.register(user: User(firstName: firstName, secondName: secondName, email: email, imageUrl: imageUrl ));
    signUpRes = service.registerStatusCode;
    notifyListeners();
  }
  bool isLoading=false;
  void loadingT(){
    isLoading = true;
    notifyListeners();
  }
  void loadingF(){
    isLoading = false;
    notifyListeners();
  }


  void tooglePassword(){
    passwordObsecure=!passwordObsecure;
    notifyListeners();
  }
  void toogleConfirmPassword(){
    confirmPasswordObsecure=!confirmPasswordObsecure;
    notifyListeners();
  }
}