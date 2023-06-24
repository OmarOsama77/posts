import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:posts/Api/api_service.dart';
import 'package:posts/models/user.dart';
import 'package:posts/providers/comments_view_model.dart';
import 'package:posts/providers/home_view_model.dart';
import 'package:posts/providers/login_view_model.dart';
import 'package:posts/providers/my_posts_view_model.dart';
import 'package:posts/providers/posts_view_model.dart';
import 'package:posts/providers/settings_provider.dart';
import 'package:posts/providers/upload_post_view_model.dart';
import 'package:posts/screens/authentication_screens/login.dart';
import 'package:posts/screens/navigation/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import '../../providers/splash_screen_view_model.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HomeViewModel>(context, listen: false);
    var data2 = Provider.of<SettingViewModel>(context, listen: false);
    var data3 = Provider.of<UploadPostViewModel>(context, listen: false);
    var data4 = Provider.of<MyPostsViewModel>(context, listen: false);
    var data5 = Provider.of<CommentsViewModel>(context, listen: false);
    var viewModel = Provider.of<SplashViewModel>(context, listen: true);

    return Scaffold(
        body: FutureBuilder(
            future: viewModel.autoLogin(context, () {
              data.user = viewModel.userData;
              data2.user = viewModel.userData;
              data3.user = viewModel.userData;
              data4.userData = viewModel.userData;
              data5.user = viewModel.userData;
            }),
            builder: (context, snaphoot) {
              if (snaphoot.hasData) {
                  if (snaphoot.data as bool) {
                    Future.delayed(Duration.zero,(){
                      Navigator.pushReplacementNamed(
                          context, "/bottom_navigation_bar");
                    });
                  } else {

                    Future.delayed(Duration.zero,(){
                   Navigator.pushReplacementNamed(context, "/login");
                   });
                  }
              }
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(color: Colors.white70),
                child: Lottie.asset("assets/lottie_splash2.json"),
              );
            })

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
