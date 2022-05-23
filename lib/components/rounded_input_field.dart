import 'package:flutter/material.dart';
import 'package:wedding_planner/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color(0xFFF14266),
          ),
          hintText: hintText,
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
      ),
    );
  }
}
