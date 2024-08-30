import 'package:flutter/material.dart';
import '../all_file.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      this.textColor,
      this.color,
      this.text,
      this.onPressed,
      this.minWidth,
      this.height});
  final Color? textColor;
  final Color? color;
  final String? text;
  final Function()? onPressed;
  final double? minWidth;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      minWidth: minWidth,
      height: height,
      onPressed: onPressed,
      child: Text(
        text!,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
