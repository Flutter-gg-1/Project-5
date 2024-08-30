import 'package:flutter/material.dart';

import '../../core/all_file.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyColors.whiteTextColor,
      body: Center(
        child: Text('Explore'),
      ),
    );
  }
}
