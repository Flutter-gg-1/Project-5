import 'package:flutter/material.dart';
import '../all_file.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      this.textColor,
      this.text,
      this.onPressed,
      this.minWidth,
      this.height});
  final Color? textColor;
  final String? text;
  final Function()? onPressed;
  final double? minWidth;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidthScreen(width: minWidth ?? 0.3),
      height: context.getWidthScreen(width: height ?? 0.09),
      decoration: BoxDecoration(
        color: MyColors.whiteTextColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: const TextStyle(color: MyColors.pinkColor),
        ),
      ),
    );
  }
}
