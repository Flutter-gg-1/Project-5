
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFeild extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFeild({
    super.key,
    required this.hintText,
    required this.maxLines,
    this.controller, this.validator, this.keyboardType, this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 32),
      child: TextFormField(
        style: const TextStyle(color: Color(0xffDCD5D5)),
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator,
        controller: controller,
        minLines: maxLines,
        maxLines: maxLines,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Color(0xffb8b8b8)),
            filled: true,
            fillColor: const Color(0xff2e2e2e),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            )),
      ),
    );
  }
}
