import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main-top1.png",
              height: size.height * 0.28,
            ),
          ),
          Positioned(
            top: 126,
            right: 25,
            child: Image.asset(
              "assets/images/main-top2.png",
              height: size.height * 0.13,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
