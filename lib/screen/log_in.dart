import 'package:flutter/material.dart';
import 'package:project_5/core/all_file.dart';

class HomScreen extends StatelessWidget {
  const HomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyContainer(
              child: MyTextField(),
            ),
          ],
        ),
      ),
    );
  }
}
