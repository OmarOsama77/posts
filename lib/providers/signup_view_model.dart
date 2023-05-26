import 'dart:io';

import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Api/api_service.dart';

class SignupViewModel with ChangeNotifier{
  bool validation(String password,String confirmPassword){
    if(password==confirmPassword){
      return true;
    }
    return false;
  }
   var selectedImage;
  Future<void> uploadUserPicture()async{
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






}