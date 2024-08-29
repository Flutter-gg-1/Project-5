import 'package:flutter/material.dart';
import 'package:project_5/core/all_file.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidthScreen(width: 0.96),
      height: context.getHeightScreen(height: 0.45),
      decoration: const BoxDecoration(
        color: MyColors.containerBlackColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
