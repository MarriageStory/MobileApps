import 'package:flutter/material.dart';
//navbar
import 'package:wedding_planner/navbar/navbar.dart';
//sign up & sign in
import 'package:wedding_planner/screens/signin/signin_screen.dart';
import 'package:wedding_planner/screens/signup/signup_screen.dart';
//splash
import 'package:wedding_planner/screens/splash/splash_screen.dart';
//welcome
import 'package:wedding_planner/screens/welcome/welcome_screen.dart';
//task
import 'package:wedding_planner/screens/task/task_screen.dart';
import 'package:wedding_planner/screens/task/task_form.dart';
import 'package:wedding_planner/screens/task/task_edit_form.dart';
import 'package:wedding_planner/screens/task/task_detail.dart';
//payment
import 'package:wedding_planner/screens/home_page/home_page.dart';
import 'package:wedding_planner/screens/payment/payment_detail.dart';
import 'package:wedding_planner/screens/payment/payment_screen.dart';
import 'package:wedding_planner/screens/payment/payment_add.dart';
import 'package:wedding_planner/screens/payment/payment_edit.dart';
import 'package:wedding_planner/screens/payment/payment_add_detail.dart';
//teams
import 'package:wedding_planner/screens/teams/teams_screen.dart';

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
      title: 'Marriage Story',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFFFA5D76),
        scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        // '/': (context) => const TaskForm(),
        '/welcome-screen': (context) => const WelcomeScreen(),
        '/home-page': (context) => const HomePage(),
        // '/payment': (context) => PaymentPage(),
        '/detail-payment': (context) => const DetailPayment(),
        // '/payment-add': (context) => AddPayment(),
        '/payment-add-detail': (context) => const AddDetailPayment(),
        '/payment-edit': (context) => const EditPayment(),
        '/task-page': (context) => const TaskScreen(),
        '/task-form': (context) => const TaskForm(),
        '/task-edit-form': (context) => const TaskEditForm(),
        '/detail-task': (context) => const DetailTask(),
        // '/teams': (context) => TeamScreen(),
        '/base-screen': (context) => BaseScreen(
              index: 0,
            ),
        '/login': (context) => const SignInScreen(),
      },
      // home: BaseScreen(),
    );
  }
}
