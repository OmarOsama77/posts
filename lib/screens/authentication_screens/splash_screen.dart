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

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
  var data = Provider.of<HomeViewModel>(context,listen: false);
  var viewModel = Provider.of<SplashViewModel>(context,listen: true);
    viewModel.nav2(context);
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

        // Container(
        //   width: double.infinity,
        //   height: double.infinity,
        //   decoration: BoxDecoration(
        //       color: Colors.white70
        //   ),
        //   child:Lottie.asset("assets/lottie_splash2.json"),
        // )

    );
  }
}
/*
FutureBuilder(
                     future: viewModel.autoLogin(context, () {
                       print('sda');
                           }),
                     builder:(context,snaphoot){
                        if(snaphoot.connectionState == ConnectionState.waiting){
                       return   Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white70
                            ),
                            child:Lottie.asset("assets/lottie_splash2.json"),
                          );
                        }else if(snaphoot.hasData){
                          print('snapshoot has data');
                           }else{
                            return
                        }
                 })
 */