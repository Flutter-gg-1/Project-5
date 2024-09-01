import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final int minLines;
  final int maxLines;
  final TextInputType keyboardType;
  final bool obscureText; 

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.minLines = 1,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.obscureText = false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextField(
          style: TextStyle(color: Colors.white),
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          keyboardType: keyboardType,
          obscureText: obscureText, 
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Color.fromRGBO(184, 184, 184, 1)),
            filled: true,
            fillColor: Color.fromRGBO(246, 242, 242, 0.118),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
