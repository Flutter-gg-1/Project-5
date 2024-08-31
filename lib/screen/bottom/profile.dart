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

          MyContainer(
            width: context.getWidthScreen(width: 0.9),
            height: context.getHeightScreen(height: 0.2),
            color: MyColors.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: context.getWidthScreen(width: 0.21),
                      height: context.getHeightScreen(height: 0.11),
                      decoration: BoxDecoration(
                        color: MyColors.whiteTextColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                        ),
                      ),
                    ),
                    const Flexible(
                      child: ListTile(
                        title: Text('example',
                            style: TextStyle(color: MyColors.whiteTextColor)),
                        subtitle: Text('example@example.com',
                            style: TextStyle(color: MyColors.whiteTextColor)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //__________Button
          SizedBox(height: context.getHeightScreen(height: 0.1)),
          MaterialButton(
            color: MyColors.whiteTextColor,
            minWidth: context.getWidthScreen(width: 0.6),
            height: context.getHeightScreen(height: 0.05),
            onPressed: () {
              context.showScreen(const NewPost());
            },
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
