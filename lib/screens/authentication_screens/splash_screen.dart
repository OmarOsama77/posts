import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/models/user.dart';
import 'package:posts/providers/home_view_model.dart';
import 'package:posts/providers/login_view_model.dart';
import 'package:posts/providers/posts_view_model.dart';
import 'package:posts/screens/authentication_screens/login.dart';
import 'package:posts/screens/navigation/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../../providers/splash_screen_view_model.dart';




class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<LoginViewModel>(context,listen: false);
    final viewModel2 = Provider.of<SplashViewModel>(context,listen: false);

      viewModel.findUserByEmail(viewModel2.currentUser!.email.toString());



      viewModel2.nav2(context);


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:


        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white70
          ),
          child:Lottie.asset("assets/lottie_splash2.json"),
        )

    );
  }
}
