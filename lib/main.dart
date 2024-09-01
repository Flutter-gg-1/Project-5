import 'package:flutter/material.dart';
import 'package:project_5/src/home/guest_home_screen.dart';
import 'package:project_5/src/services/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: GuestHomeScreen(),
    );
  }
}
