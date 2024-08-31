import 'package:flutter/material.dart';

import '../all_file.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                  onPressed: () {
                    context.showScreen(const ExploreScreen());
                  },
                  icon: Icon(Icons.search,
                      color: MyColors.whiteTextColor,
                      size: context.getHeightScreen(height: 0.05)),
                ),
              ],
            ),
          ),
          Container(
            color: MyColors.containerBlackColor,
            height: context.getHeightScreen(height: 0.08),
            child: const TabBar(
                labelColor: MyColors.whiteTextColor,
                unselectedLabelColor: MyColors.greyTextColor,
                indicatorWeight: 3,
                indicatorColor: Colors.red,
                tabs: [
                  Tab(
                    text: 'Tech',
                  ),
                  Tab(
                    text: 'AI',
                  ),
                  Tab(
                    text: 'Cloud',
                  ),
                  Tab(
                    text: 'Robotics',
                  ),
                  Tab(
                    text: 'IoT',
                  ),
                ]),
          ),
          SizedBox(
            height: context.getHeightScreen(height: 0.02),
            child: const TabBarView(
              children: [
                Text(''),
                Text(''),
                Text(''),
                Text(''),
                Text(''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
