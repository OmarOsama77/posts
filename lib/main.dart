import 'package:flutter/material.dart';
import 'package:posts/providers/bottom_nav_bar_provider.dart';
import 'package:posts/providers/register_view_model.dart';
import 'package:posts/screens/home.dart';
import 'package:posts/screens/authentication_screens/login.dart';
import 'package:posts/screens/navigation/bottom_navigation_bar.dart';
import 'package:posts/screens/authentication_screens/signup.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>RegisterViewModel()),
        ChangeNotifierProvider(create:(_)=>NavigationProvider()),
      ],
      child: MaterialApp(
          initialRoute: '/',
        routes: {
            '/':(_)=>Login(),
          '/signup':(_)=>Signup(),
          "/home":(_)=>Home(),
          "/bottom_navigation_bar":(_)=>BottomNavigationScreen()
        },
      ),
    );
  }
}

