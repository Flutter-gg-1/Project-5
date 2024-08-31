import 'package:flutter/material.dart';
import 'package:project_5/core/all_file.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, this.child, this.width, this.height, this.color});
  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final double radius = 8;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.getWidthScreen(width: 0.96),
      height: height ?? context.getHeightScreen(height: 0.495),
      decoration: BoxDecoration(
        color: color ?? MyColors.containerBlackColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: child,
    );
  }
}
