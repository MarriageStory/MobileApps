import 'package:flutter/material.dart';
import 'package:wedding_planner/components/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({Key? key, required this.onChanged})
      : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
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
    return TextFieldContainer(
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: _obscured,
        focusNode: textFieldFocusNode,
        onChanged: widget.onChanged,
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
              _obscured ? Icons.visibility : Icons.visibility_off,
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
      ),
    );
  }
}
