import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedInputFieldForm extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextStyle valueHintStyle;
  final TextStyle valueLabelStyle;
  final TextEditingController controller;
  const RoundedInputFieldForm({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.valueHintStyle,
    required this.valueLabelStyle,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // TextFieldContainer(
        //   child:
        TextField(
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFfcabaa), width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFfcabaa), width: 2),
        ),
        hintText: hintText,
        hintStyle: valueHintStyle,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
      ),
      controller: controller,
    );
  }
}
