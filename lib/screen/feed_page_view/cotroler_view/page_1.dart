import 'package:flutter/material.dart';
import '../../../core/all_file.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteTextColor,
      body: Column(
        children: [
          const SizedBox(height: 100),
          Container(
            color: MyColors.primaryColor,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
