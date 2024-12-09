import 'package:flutter/material.dart';

class CustomAuthInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Color color;
  final Color focusColor;
  final TextEditingController? controller;
  final obscureText;

  const CustomAuthInput({
    super.key,
    required this.hintText,
    required this.icon,
    required this.color,
    required this.focusColor,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: focusColor,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: color),
        focusColor: focusColor,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: focusColor, width: 2),
        ),
      ),
    );
  }
}
