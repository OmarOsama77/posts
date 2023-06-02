import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/screens/authentication_screens/login.dart';
import 'package:posts/screens/navigation/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../../providers/splash_screen_view_model.dart';



class SplashScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SplashViewModel>(context);
    ApiService service = ApiService();
    return Scaffold(
        body:
            FutureBuilder(
                future: service.getPosts(),
                builder:(context,snapshoot){
                 if(snapshoot.hasData&&viewModel.checkAutoLogin(context)){
                   return BottomNavigationScreen();
                 }
                 if(snapshoot.hasData&&!viewModel.checkAutoLogin(context)){
                   return Login();
                 }
                 return Container(
                   width: double.infinity,
                   height: double.infinity,
                   decoration: BoxDecoration(color: Colors.white70),
                   child: Lottie.asset("assets/lottie_splash2.json"),
                 );
            })




    //     Container(
    //   width: double.infinity,
    //   height: double.infinity,
    //   decoration: BoxDecoration(color: Colors.white70),
    //   child: Lottie.asset("assets/lottie_splash2.json"),
    // )
    );
  }
}
