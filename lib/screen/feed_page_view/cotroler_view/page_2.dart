import 'package:flutter/material.dart';
import '../../../core/all_file.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.whiteTextColor,
      body: Column(
        children: [
          SizedBox(height: 100),
          Image(
            image: AssetImage('assets/images/intro/int2.png'),
            // width: getScreenSize(context).width / 2 + 150,
          ),
          SizedBox(height: 30),
          Text(
            'We have a special discount for the disabled',
            style: TextStyle(
                // fontSize: getScreenSize(context).width / 20,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
