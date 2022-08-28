import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planner/screens/splash/components/body.dart';
import 'package:wedding_planner/screens/welcome/welcomeScreen.dart';

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
        checkToken();
      },
    );
  }

  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token != null) {
      Navigator.pushReplacementNamed(context, "/welcome-screen");
    } else {
      Navigator.pushReplacementNamed(context, "/welcome-screen");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
