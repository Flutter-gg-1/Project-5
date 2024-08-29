import 'package:flutter/material.dart';
import '../extensions/color_ext.dart';
import '../utils/typedefs.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.isObscure = false,
    required this.hint,
  });
  final TextEditingController controller;
  final bool isObscure;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: C.metal,
          hintText: hint,
          hintStyle: const TextStyle(
              color: C.text2, fontSize: 15, fontWeight: FW.w500),
        ),
      ),
    );
  }
}
