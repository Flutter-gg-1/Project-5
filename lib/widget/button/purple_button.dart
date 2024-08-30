import 'package:blog_app/widget/text/custom_text.dart';
import 'package:flutter/material.dart';

class PurpleButton extends StatelessWidget {
  final Function()? onPressed;
  const PurpleButton({
    super.key, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(173, 35),
          backgroundColor: const Color(0xff8d7eb6),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5))),
      child: const CustomText(text: 'Login'),
    );
  }
}