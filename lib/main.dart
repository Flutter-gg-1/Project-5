import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_5/screen/log_in.dart';
import 'servers/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomScreen(),
    );
  }
}
