import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posts/models/user.dart';
import '../Api/api_service.dart';

class SignupViewModel with ChangeNotifier{
  ApiService service  = ApiService();
  SignupViewModel(this.service);
  bool validation(String password,String confirmPassword){
    if(password==confirmPassword){
      return true;
    }
    return false;
  }
   var selectedImage;
  Future<void> getUserPicture()async{
     var imagePicker = ImagePicker();
     final pickedImage =  await imagePicker.pickImage(source: ImageSource.gallery);
     final file =File(pickedImage!.path);
     selectedImage = FileImage(file) as ImageProvider<Object>;

     notifyListeners();
  }
  bool isThereImage(){
    if(selectedImage==null){
        return false;
    }
    return true;
  }
  void signUp(String firstName , String secondName , String email,String imageUrl ){
    service.register(user: User(firstName: firstName, secondName: secondName, email: email, imageUrl: imageUrl), firstName: firstName);
  }


}