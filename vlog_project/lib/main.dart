import 'package:flutter/material.dart';
import 'package:vlog_project/service/service_locator.dart';
import 'package:vlog_project/screens/auth/splach_screen.dart';


void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); 
  await setupLocator(); 

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vlog Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
