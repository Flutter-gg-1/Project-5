import 'package:flutter/material.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
                children: [
                  TextSpan(text: text, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const TextSpan(text: ' *', style: TextStyle(color: Color(0xffDD403C), fontSize: 22, fontWeight: FontWeight.bold)),
                ]
              ));
  }
}