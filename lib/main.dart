import 'package:flutter/material.dart';
import 'package:project_5/screen/log_in.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomScreen(),
    );
  }
}
