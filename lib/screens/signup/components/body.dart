import 'package:flutter/material.dart';
import 'package:wedding_planner/components/already_have_an_account_check.dart';
import 'package:wedding_planner/components/rounded_button.dart';
import 'package:wedding_planner/components/rounded_input_field.dart';
import 'package:wedding_planner/components/rounded_password_field.dart';
import 'package:wedding_planner/screens/signin/signin_screen.dart';
import 'package:wedding_planner/screens/signup/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: size.height * 0.12,
                left: size.width * 0.1,
                child: Column(
                  children: [
                    Text(
                      "Hello ,",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        letterSpacing: -0.2,
                      ),
                    ),
                    Text(
                      "Sign Up !",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 37),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedInputField(
                      icon: Icons.person,
                      hintText: "Username",
                      onChanged: (value) {},
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                    ),
                    RoundedInputField(
                      icon: Icons.mail,
                      hintText: "Email",
                      onChanged: (value) {},
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                      ),
                      child: RoundedButton(
                        text: "Sign Up",
                        press: () {},
                        color: Color(0xFFFA5D76),
                        borderColor: Color(0xFFFA5D76),
                        textColor: Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 36,
                left: 0,
                right: 0,
                child: AlreadyHaveAnAccountCheck(
                  signin: false,
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
