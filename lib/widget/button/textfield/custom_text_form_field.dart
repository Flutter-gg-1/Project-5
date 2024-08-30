import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.userTextcontroller,
    required this.onChanged,
    required this.validator,
    this.keyboardType,
    this.obscure = false,
    required this.hintText,
  });

  final TextEditingController userTextcontroller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscure;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userTextcontroller,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscure,
      decoration: InputDecoration(
        
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
