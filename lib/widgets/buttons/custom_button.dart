import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.foregroundColor,
      required this.backgroundColor,
      required this.title,
      required this.height,
      required this.width,
      required this.onPressed});
  final Color foregroundColor;
  final Color backgroundColor;
  final String title;
  final double height;
  final double width;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }
}
