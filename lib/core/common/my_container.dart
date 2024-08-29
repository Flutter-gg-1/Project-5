import 'package:flutter/material.dart';
import 'package:project_5/core/all_file.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, this.child, this.width, this.height});
  final Widget? child;
  final double? width;
  final double? height;
  final double radius = 8;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.getWidthScreen(width: 0.96),
      height: height ?? context.getHeightScreen(height: 0.45),
      decoration: BoxDecoration(
        color: MyColors.containerBlackColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: child,
    );
  }
}
