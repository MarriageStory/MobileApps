import 'package:flutter/material.dart';

import 'package:wedding_planner/navbar/navbar.dart';
import 'package:wedding_planner/screens/homePage/homePage.dart';
import 'package:wedding_planner/screens/payment/payment_detail.dart';
import 'package:wedding_planner/screens/payment/payment_screen.dart';

import 'package:wedding_planner/screens/signin/signin_screen.dart';
import 'package:wedding_planner/screens/signup/signup_screen.dart';
import 'package:wedding_planner/screens/splash/splash_screen.dart';
import 'package:wedding_planner/screens/teams/teams_screen.dart';
import 'package:wedding_planner/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wedding Planner',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Color(0xFFFA5D76),
        scaffoldBackgroundColor: Color(0xFFF6F6F6),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
      },
    );
  }
}
