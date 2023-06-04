import 'package:flutter/material.dart';
import 'package:posts/models/user.dart';

class SettingViewModel with ChangeNotifier{
 User? user;
 SettingViewModel(this.user);
   
}