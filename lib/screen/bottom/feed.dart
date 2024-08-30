import 'package:flutter/material.dart';

import '../../core/all_file.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: ListView.builder(
          itemBuilder: (context, index) => const Card(
                color: MyColors.containerBlackLightColor,
                child: ListTile(
                  title: Text(
                    'title',
                    style: TextStyle(color: MyColors.whiteTextColor),
                  ),
                  subtitle: Text(
                    'subtitle',
                    style: TextStyle(color: MyColors.greyTextColor),
                  ),
                ),
              )),
    );
  }
}
