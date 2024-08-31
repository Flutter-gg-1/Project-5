import 'package:flutter/material.dart';

class CustomTextFormatField extends StatelessWidget {
  const CustomTextFormatField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.minlines,
      this.validator,
      required this.obsecure});
  final String hintText;
  final TextEditingController controller;
  final int minlines;
  final String? Function(String?)? validator;
  final bool obsecure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      minLines: minlines,
      maxLines: minlines,
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: const Color(0x12FFFFFF),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Color(0xffB8B8B8),
              fontSize: 14,
              fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none)),
    );
  }
}
