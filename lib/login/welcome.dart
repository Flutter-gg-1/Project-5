
import 'package:flutter/material.dart';

class WelcomeTexts extends StatelessWidget {
  const WelcomeTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome Back!",
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          "Glad to see you again",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
}
