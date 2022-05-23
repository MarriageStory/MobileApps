import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool signin;
  final Function()? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.signin = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          signin ? "Don't have an account ? " : "Already have an account ? ",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 14,
            letterSpacing: -0.2,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            signin ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: Color(0xFFFA5D76),
              fontWeight: FontWeight.w500,
              fontSize: 14,
              letterSpacing: -0.2,
            ),
          ),
        ),
      ],
    );
  }
}
