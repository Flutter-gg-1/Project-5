import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom(
      {super.key,
      required this.text,
      required this.color,
      required this.weight,
      required this.fontSize});
  final String text;
  final Color color;
  final FontWeight weight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: weight, fontSize: fontSize),
    );
  }
}
