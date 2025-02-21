import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:posts/providers/authentication_view_model.dart';
import 'package:posts/providers/bottom_nav_bar_provider.dart';
import 'package:posts/providers/comments_view_model.dart';
import 'package:posts/providers/home_view_model.dart';
import 'package:posts/providers/likes_view__model.dart';
import 'package:posts/providers/login_view_model.dart';
import 'package:posts/providers/my_posts_view_model.dart';
import 'package:posts/providers/posts_view_model.dart';
import 'package:posts/providers/settings_provider.dart';
import 'package:posts/providers/show_others_profile.dart';
import 'package:posts/providers/signup_view_model.dart';
import 'package:posts/providers/splash_screen_view_model.dart';
import 'package:posts/providers/upload_post_view_model.dart';
import 'package:posts/providers/user_view_model.dart';
import 'package:posts/screens/comments.dart';
import 'package:posts/screens/home.dart';
import 'package:posts/screens/authentication_screens/login.dart';
import 'package:posts/screens/myPosts.dart';
import 'package:posts/screens/navigation/bottom_navigation_bar.dart';
import 'package:posts/screens/authentication_screens/signup.dart';
import 'package:posts/screens/authentication_screens/splash_screen.dart';
import 'package:posts/screens/show_others_profile.dart';
import 'package:posts/widgets/show_image.dart';
import 'package:provider/provider.dart';

import 'package:posts/data/network/api_service.dart';

Future<void>  main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(const MyApp());
 }


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>NavigationProvider()),
        ChangeNotifierProvider(create:(_)=>SignupViewModel(ApiService())),
        ChangeNotifierProvider(create:(_)=>AuthenticationViewModel()),
        ChangeNotifierProvider(create:(_)=>SplashViewModel()),
        ChangeNotifierProvider(create:(_)=>LoginViewModel()),
        ChangeNotifierProxyProvider<LoginViewModel,HomeViewModel>(create: (_)=>HomeViewModel(null), update: (context,loginViewModel,homeViewModel){
            return HomeViewModel(loginViewModel.userData);
      }),
        ChangeNotifierProxyProvider<LoginViewModel,UploadPostViewModel>(create: (_)=>UploadPostViewModel(null), update: (context,loginViewModel,uploadPostViewModel){
          return UploadPostViewModel(loginViewModel.userData);
        }),
        ChangeNotifierProxyProvider<LoginViewModel,SettingViewModel>(create: (_)=>SettingViewModel(null), update: (context,loginViewModel,settingViewModel){
          return SettingViewModel(loginViewModel.userData);
        }),
       ChangeNotifierProvider(create:(_)=>PostsViewModel()),
        ChangeNotifierProxyProvider<LoginViewModel,CommentsViewModel>(create: (_)=>CommentsViewModel(null), update: (context,loginViewModel,commentsViewModel){
          return CommentsViewModel(loginViewModel.userData);
        }),
        // ChangeNotifierProvider(create:(_)=>MyPostsViewModel()),
        ChangeNotifierProxyProvider<LoginViewModel,MyPostsViewModel>(create: (_)=>MyPostsViewModel(null), update: (context,loginViewModel,myPostsViewModel){
          return MyPostsViewModel(loginViewModel.userData);
        }),
        ChangeNotifierProvider(create:(_)=>UserViewModel()),
        ChangeNotifierProvider(create:(_)=>ShowOthersProfileVM()),
        ChangeNotifierProvider(create:(_)=>LikedViewModel()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          initialRoute: '/',
        routes: {
            '/':(_)=>SplashScreen(),
           '/login':(_)=>Login(),
           '/signup':(_)=>Signup(),
           "/home":(_)=>Home(),
           "/bottom_navigation_bar":(_)=>BottomNavigationScreen(),
          "/comments":(_)=>Comments(),
          "/myPosts":(_)=>MyPosts(),
          "/showImage":(_)=>ShowImage(),
          "/showOthersProfile":(_)=>ShowOthersProfile()
        },
      ),
    );
  }
}