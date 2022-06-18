import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planner/components/already_have_an_account_check.dart';
import 'package:wedding_planner/components/rounded_button.dart';
import 'package:wedding_planner/components/text_field_container.dart';
import 'package:wedding_planner/screens/signin/components/background.dart';
import 'package:wedding_planner/screens/signup/signup_screen.dart';
import 'package:wedding_planner/service/auth_service.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                            AuthService.authLogin(data).then((response) {
                              if (response.accessToken != "") {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  "/base-screen",
                                  (route) => false,
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Berhasil Login")));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Password Salah")));
                              }
                            });
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Terdapat Kesalahan")));
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
