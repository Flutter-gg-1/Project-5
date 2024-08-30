import 'package:blog_app/current_page.dart';
import 'package:blog_app/screens/signin_screen.dart';
import 'package:blog_app/services/setup.dart';
import 'package:flutter/material.dart';

void main() async {
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: box.read("token") != null
            ? const CurrentPage()
            : const SigninScreen());
  }
}
