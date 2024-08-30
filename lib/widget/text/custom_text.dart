import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  const CustomText({super.key, required this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
          fontSize: fontSize ?? 16, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: 'Inter'),
    );
  }
}
