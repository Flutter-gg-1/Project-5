import 'package:flutter/material.dart';

import '../../core/all_file.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Column(
        children: [
          SizedBox(height: context.getHeightScreen(height: 0.1)),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('Account',
                style: TextStyle(color: MyColors.whiteTextColor)),
          ),
          SizedBox(height: context.getHeightScreen(height: 0.2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.search, color: MyColors.whiteTextColor),
              SizedBox(width: context.getWidthScreen(width: 0.02)),
              const Text(
                'My Blogs',
                style: TextStyle(color: MyColors.whiteTextColor),
              ),
            ],
          ),
          SizedBox(height: context.getHeightScreen(height: 0.1)),
          MaterialButton(
            color: MyColors.whiteTextColor,
            minWidth: context.getWidthScreen(width: 0.6),
            height: context.getHeightScreen(height: 0.05),
            onPressed: () {},
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
