import 'package:flutter/material.dart';

class AddNewScreen extends StatelessWidget {
  const AddNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(
  leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
),
    );
  }
}