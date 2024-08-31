import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.userTextcontroller,
    required this.onChanged,
     this.validator,
    this.keyboardType,
    this.obscure = false,
    required this.hintText,
    this.maxLines = 1,
  });

  final TextEditingController userTextcontroller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscure;
  final String hintText;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userTextcontroller,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscure,
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: const Color(0xffB8B8B8),
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
      ),
    );
  }
}
