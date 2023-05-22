import 'package:flutter/material.dart';
import 'package:posts/providers/register_view_model.dart';
import 'package:posts/screens/login.dart';
import 'package:posts/screens/signup.dart';
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
        ChangeNotifierProvider(create:(_)=>RegisterViewModel())
      ],
      child: MaterialApp(
          initialRoute: '/',
        routes: {
            '/':(_)=>Login(),
          '/signup':(_)=>Signup()
        },
      ),
    );
  }
}

