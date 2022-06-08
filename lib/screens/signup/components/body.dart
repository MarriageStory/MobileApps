import 'package:flutter/material.dart';
import 'package:wedding_planner/components/already_have_an_account_check.dart';
import 'package:wedding_planner/components/rounded_button.dart';
import 'package:wedding_planner/components/rounded_input_field.dart';
import 'package:wedding_planner/components/rounded_password_field.dart';
import 'package:wedding_planner/components/text_field_container.dart';
import 'package:wedding_planner/model/regisAuth.dart';
import 'package:wedding_planner/screens/signin/signin_screen.dart';
import 'package:wedding_planner/screens/signup/components/background.dart';
import 'package:wedding_planner/service/regisService.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _userNameController = TextEditingController();
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
                    TextFieldContainer(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.person,
                              color: Color(0xFFFA5D76),
                            ),
                            labelText: 'Username'),
                        controller: _userNameController,
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
                    TextFieldContainer(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.email,
                              color: Color(0xFFFA5D76),
                            ),
                            labelText: 'Email'),
                        controller: _emailController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                      ),
                      child: RoundedButton(
                        text: "Sign Up",
                        color: Color(0xFFFA5D76),
                        borderColor: Color(0xFFFA5D76),
                        textColor: Color(0xFFFFFFFF),
                        press: () async {
                          Map<String, dynamic> body = {
                            'name': _userNameController.text,
                            'email': _emailController.text,
                            'password': _passwordController.text,
                          };
                          await regisService().register(body);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "You have successfully create account")));
                        },
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
