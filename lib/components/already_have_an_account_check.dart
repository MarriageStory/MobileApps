import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool signIn;
  final Function()? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.signIn = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          signIn ? "Don't have an account ? " : "Already have an account ? ",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 14,
            letterSpacing: -0.2,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            signIn ? "Sign Up" : "Sign In",
            style: const TextStyle(
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
