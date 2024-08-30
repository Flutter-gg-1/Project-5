import 'package:flutter/material.dart';

import '../../core/all_file.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteTextColor,
      appBar: AppBar(
        backgroundColor: MyColors.containerBlackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:
              const Icon(Icons.arrow_back_ios, color: MyColors.whiteTextColor),
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.showScreen(const SavedScreen());
              },
              icon: Icon(
                Icons.search,
                color: MyColors.whiteTextColor,
                size: context.getHeightScreen(height: 0.05),
              ))
        ],
      ),
      body: const Center(
        child: Text('Saved'),
      ),
    );
  }
}
