import 'package:flutter/material.dart';
import 'package:project_5/core/all_file.dart';
import 'package:project_5/my_extension/get_screen.dart';

class HomScreen extends StatelessWidget {
  const HomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: context.getWidthScreen(width: 0.96),
              height: context.getHeightScreen(height: 0.45),
              decoration: const BoxDecoration(
                color: MyColors.containerBlackColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
