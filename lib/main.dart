import 'package:flutter/material.dart';
import 'package:project_5/pages/login_screen.dart';
import 'package:project_5/services/setup.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)),
      home: const LoginScreen(),
    );
  }
}
