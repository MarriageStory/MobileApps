import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wedding_planner/screens/splash/components/body.dart';
import 'package:wedding_planner/screens/welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, "/welcome-screen");
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
