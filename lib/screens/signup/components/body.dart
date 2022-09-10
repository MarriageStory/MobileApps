import 'package:flutter/material.dart';
import 'package:wedding_planner/components/already_have_an_account_check.dart';
import 'package:wedding_planner/components/rounded_button.dart';
import 'package:wedding_planner/components/text_field_container.dart';
import 'package:wedding_planner/screens/signin/signin_screen.dart';
import 'package:wedding_planner/screens/signup/components/background.dart';
import 'package:wedding_planner/service/auth_service.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(
      () {
        _obscured = !_obscured;
        if (textFieldFocusNode.hasPrimaryFocus)
          return; // If focus is on text field, dont unfocus
        textFieldFocusNode.canRequestFocus =
            false; // Prevents focus if tap on eye
      },
    );
  }

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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          icon: Icon(
                            Icons.person,
                            color: Color(0xFFF14266),
                          ),
                          hintText: "Username",
                          hintStyle: const TextStyle(
                            color: Color(0xFF2F2F2F),
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            letterSpacing: -0.2,
                            height: 2,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Color(0xFF2F2F2F),
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          letterSpacing: -0.2,
                        ),
                        controller: _userNameController,
                      ),
                    ),
                    // RoundedPasswordField(
                    //   onChanged: (value) {},
                    // ),
                    TextFieldContainer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Color(0xFFF14266),
                          ),
                          hintText: "Email",
                          hintStyle: const TextStyle(
                            color: Color(0xFF2F2F2F),
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            letterSpacing: -0.2,
                            height: 2,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Color(0xFF2F2F2F),
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          letterSpacing: -0.2,
                        ),
                        controller: _emailController,
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscured,
                        focusNode: textFieldFocusNode,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(
                            color: Color(0xFF2F2F2F),
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            letterSpacing: -0.2,
                            height: 2,
                          ),
                          icon: const Icon(
                            Icons.lock,
                            color: Color(0xFFF14266),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: _toggleObscured,
                            child: Icon(
                              _obscured
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: const Color(0xFFF14266),
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Color(0xFF2F2F2F),
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          letterSpacing: -0.2,
                        ),
                        controller: _passwordController,
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

                          try {
                            await AuthService.authRegister(body).then((value) {
                              if (value == true) {
                                Navigator.pushReplacementNamed(
                                    context, "/login");
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'You have successfully create a account')));
                              }
                            });
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Terdapat Kesalahan !')));
                          }
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
                  signIn: false,
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
