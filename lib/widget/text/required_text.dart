import 'package:blog_app/text/custom_text.dart';
import 'package:flutter/material.dart';

class RequiredText extends StatelessWidget {
  final String text;
  const RequiredText({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      CustomText(text: text),
      const Text('  *',style: TextStyle(color: Colors.red),)
    ],);
  }
}