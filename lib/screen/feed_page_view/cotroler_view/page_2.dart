import 'package:flutter/material.dart';
import '../../../core/all_file.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteTextColor,
      body: Column(
        children: [
          const SizedBox(height: 100),
          Container(
            color: MyColors.pinkColor,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
