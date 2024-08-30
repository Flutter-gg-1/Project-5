import 'package:blog_app/src/home_screen.dart';
import 'package:blog_app/src/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff111111),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff1e1e1e),
            iconTheme: IconThemeData(color: Colors.white)),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xff131313))),
      home: const LoginScreen(),
    );
  }
}
