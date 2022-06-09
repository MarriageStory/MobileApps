import 'dart:convert';
//cek
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planner/components/already_have_an_account_check.dart';
import 'package:wedding_planner/components/rounded_button.dart';
import 'package:wedding_planner/components/rounded_input_field.dart';
import 'package:wedding_planner/components/rounded_password_field.dart';
import 'package:wedding_planner/components/text_field_container.dart';
import 'package:wedding_planner/model/loginAuth.dart';
import 'package:wedding_planner/screens/signin/components/background.dart';
import 'package:wedding_planner/screens/signup/signup_screen.dart';
import 'package:wedding_planner/service/loginService.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                      "Welcome Back ,",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        letterSpacing: -0.2,
                      ),
                    ),
                    Text(
                      "Sign In !",
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
                    // RoundedInputField(
                    //   icon: Icons.person,
                    //   hintText: "Username",
                    //   onChanged: (value) {},
                    // ),
                    TextFieldContainer(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.person,
                              color: Color(0xFFFA5D76),
                            ),
                            labelText: 'Email'),
                        controller: _emailController,
                      ),
                    ),
                    // RoundedPasswordField(
                    //   onChanged: (value) {},
                    // ),
                    TextFieldContainer(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.paste,
                              color: Color(0xFFFA5D76),
                            ),
                            labelText: 'Password'),
                        controller: _passwordController,
                      ),
                    ),
                    GestureDetector(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                      ),
                      child: RoundedButton(
                        text: "Sign In",
                        press: () {
                          var data = <String, dynamic>{
                            'email': _emailController.text,
                            'password': _passwordController.text,
                          };

                          try {
                            loginService().logins(data).then((response) {
                              if (response.token != "") {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  "/home-page",
                                  (route) => false,
                                );
                              } else {
                                print("Gagal login");
                              }
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        color: Color(0xFFFA5D76),
                        borderColor: Color(0xFFFA5D76),
                        textColor: Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: size.height * 0.044,
                left: 0,
                right: 0,
                child: AlreadyHaveAnAccountCheck(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
