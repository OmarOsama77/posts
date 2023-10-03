import 'package:flutter/material.dart';


import '../models/user.dart';


class HomeViewModel with ChangeNotifier{
  User?  user;
  HomeViewModel(this.user);

}