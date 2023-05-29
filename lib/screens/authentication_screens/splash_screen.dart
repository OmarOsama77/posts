import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
    final data = Provider.of<SplashViewModel>(context,listen: false);
    data.navigation(context);
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
