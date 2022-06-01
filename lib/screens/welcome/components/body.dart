import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wedding_planner/components/rounded_button.dart';
import 'package:wedding_planner/screens/signin/signin_screen.dart';
import 'package:wedding_planner/screens/signup/signup_screen.dart';
import 'package:wedding_planner/screens/welcome/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/icons/logo-white.png",
                height: size.height * 0.22,
              ),
            ),
            Positioned(
              bottom: size.height * 0.08,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(
                    text: "Sign In",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignInScreen();
                          },
                        ),
                      );
                    },
                    color: Colors.transparent,
                    borderColor: Color(0xFFFFFFFF),
                    textColor: Color(0xFFFFFFFF),
                  ),
                  RoundedButton(
                    text: "Sign Up",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                    color: Color(0xFFFA5D76),
                    borderColor: Color(0xFFFA5D76),
                    textColor: Color(0xFFFFFFFF),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
