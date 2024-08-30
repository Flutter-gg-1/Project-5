import 'package:flutter/material.dart';

import '../../core/all_file.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.getHeightScreen(height: 0.1)),
            const MyTextField(
              hintText: 'Search for news',
              prefixIcon: Icon(Icons.search, color: MyColors.whiteTextColor),
            ),
            SizedBox(height: context.getHeightScreen(height: 0.2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.search, color: MyColors.whiteTextColor),
                SizedBox(width: context.getWidthScreen(width: 0.02)),
                const Text(
                  'Search for news',
                  style: TextStyle(color: MyColors.whiteTextColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
