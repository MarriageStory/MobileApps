import 'package:flutter/material.dart';
import 'package:wedding_planner/components/text_field_container.dart';

class RoundedInputField extends StatefulWidget {
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
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: Color(0xFFF14266),
          ),
          hintText: widget.hintText,
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
    );
  }
}
