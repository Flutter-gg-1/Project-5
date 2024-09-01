import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vlog_project/screens/Guest_Screens/guest_home.dart';
import 'package:vlog_project/screens/auth/log_in_screen.dart';
import 'package:vlog_project/service/service_locator.dart';
import 'package:vlog_project/screens/auth/splach_screen.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter bindings are initialized
  await setupLocator(); // Initialize GetStorage and register services

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
      home: SplashScreen(), // Replace with your home screen
    );
  }
}
