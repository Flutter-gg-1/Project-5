



import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pro_5/data_handle/git_it/setup.dart';

import 'package:pro_5/page/login_page.dart';

void main() async{


  WidgetsFlutterBinding.ensureInitialized();



  setup();

  await GetStorage.init();

  runApp(const MainApp());
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,



      home: LoginPage()
    );
  }
}