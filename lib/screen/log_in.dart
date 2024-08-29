import 'package:flutter/material.dart';
import 'package:project_5/core/all_file.dart';

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
            MyContainer(
              child: Column(
                children: [
                  const MyTextField(
                    hintText: 'Enter your username',
                    leftText: 'Username',
                  ),
                  const MyTextField(
                    hintText: 'Enter your password',
                    leftText: 'Password',
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: context.getHeightScreen(height: 0.025),
                        left: context.getWidthScreen(width: 0.56)),
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(color: MyColors.pinkColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
