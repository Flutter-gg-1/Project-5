import 'package:flutter/material.dart';

import '../all_file.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: context.getHeightScreen(height: 0.08),
            color: MyColors.containerBlackColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu,
                      color: MyColors.whiteTextColor,
                      size: context.getHeightScreen(height: 0.05)),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search,
                      color: MyColors.whiteTextColor,
                      size: context.getHeightScreen(height: 0.05)),
                ),
              ],
            ),
          ),
          SizedBox(height: context.getHeightScreen(height: 0.02)),
          const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.feed, color: MyColors.whiteTextColor),
              text: 'Feed',
            ),
            Tab(
              icon:
                  Icon(Icons.explore_outlined, color: MyColors.whiteTextColor),
              text: 'Explore',
            ),
            Tab(
              icon: Icon(Icons.bookmark_border_outlined,
                  color: MyColors.whiteTextColor),
              text: 'Saved',
            ),
            Tab(
              icon: Icon(Icons.person_outline, color: MyColors.whiteTextColor),
              text: 'Profile',
            ),
          ]),
          SizedBox(
            height: context.getHeightScreen(height: 0.02),
            child: const TabBarView(
              children: [
                Text('Feed'),
                Text('Explore'),
                Text('Saved'),
                Text('Profile'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
