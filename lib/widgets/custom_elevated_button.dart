import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text, this.onPressed, required this.textColor, required this.backgroundColor, required this.width, required this.height, required this.fontSize});
  final String text;
  final Function()? onPressed;
  final Color textColor;
  final Color backgroundColor;
  final double width;
  final double height;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Center(
                        child: ElevatedButton(
                          onPressed: onPressed, 
                          style: ElevatedButton.styleFrom(backgroundColor: backgroundColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          minimumSize: Size(width, height)),
                          child: Text(text, style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: FontWeight.bold),)),
                      );
  }
}