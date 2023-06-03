
import 'package:flutter/material.dart';
import 'package:posts/screens/home.dart';

import '../models/user.dart';


class HomeViewModel with ChangeNotifier{
  User?  user;
  HomeViewModel(this.user);

}