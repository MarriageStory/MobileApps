import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planner/screens/splash/components/body.dart';

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
      const Duration(seconds: 2),
      () {
        checkToken();
      },
    );
  }

  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token != null) {
      Navigator.pushReplacementNamed(context, "/welcomeScreen");
    } else {
      Navigator.pushReplacementNamed(context, "/welcomeScreen");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
