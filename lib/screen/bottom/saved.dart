import 'package:flutter/material.dart';

import '../../core/all_file.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

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
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Saved News',
                  style: TextStyle(color: MyColors.whiteTextColor)),
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
