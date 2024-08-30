import 'package:blog_app_project/helper/extensions/screen.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.onDone});
  final String title;
  final Function()? onDone;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // <-- Radius
            ),
            foregroundColor: Colors.white,
            fixedSize: Size(context.getWidth() / 2, context.getHeight() / 18),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            backgroundColor: const Color(0xff4249A1)),
        onPressed: onDone,
        child: Text(title));
  }
}
