import 'package:flutter/material.dart';
import 'package:project/login/lofin_form.dart';
import 'package:project/login/welcome.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff111111),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WelcomeTexts(),
            SizedBox(height: 31),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
