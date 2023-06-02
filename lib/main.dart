 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:posts/providers/authentication_view_model.dart';
import 'package:posts/providers/bottom_nav_bar_provider.dart';
import 'package:posts/providers/home_view_model.dart';
import 'package:posts/providers/login_view_model.dart';
import 'package:posts/providers/settings_provider.dart';
import 'package:posts/providers/signup_view_model.dart';
import 'package:posts/providers/splash_screen_view_model.dart';
import 'package:posts/providers/upload_post_view_model.dart';
import 'package:posts/screens/home.dart';
import 'package:posts/screens/authentication_screens/login.dart';
import 'package:posts/screens/navigation/bottom_navigation_bar.dart';
import 'package:posts/screens/authentication_screens/signup.dart';
import 'package:posts/screens/authentication_screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'Api/api_service.dart';

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
        ChangeNotifierProvider(create:(_)=>SettingViewModel()),
        ChangeNotifierProvider(create:(_)=>SignupViewModel(ApiService())),
        ChangeNotifierProvider(create:(_)=>AuthenticationViewModel()),
        ChangeNotifierProvider(create:(_)=>SplashViewModel()),
        ChangeNotifierProvider(create:(_)=>UploadPost()),
        ChangeNotifierProvider(create:(_)=>HomeViewModel()),
        ChangeNotifierProvider(create:(_)=>LoginViewModel()),
      ],
      child: MaterialApp(
          initialRoute: '/',
        routes: {
            '/':(_)=>SplashScreen(),
           '/login':(_)=>Login(),
           '/signup':(_)=>Signup(),
           "/home":(_)=>Home(),
           "/bottom_navigation_bar":(_)=>BottomNavigationScreen()
        },
      ),
    );
  }
}

