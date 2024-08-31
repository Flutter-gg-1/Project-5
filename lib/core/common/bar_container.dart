import 'package:flutter/material.dart';

import '../all_file.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer(
      {super.key,
      this.icon,
      this.icon2,
      this.icon3,
      this.color,
      this.color2,
      this.child,
      this.child2});

  final Widget? icon;
  final Widget? icon2;
  final Widget? icon3;
  final Color? color;
  final Color? color2;
  final Widget? child;
  final Widget? child2;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: context.getHeightScreen(height: 0.08),
            color: color ?? MyColors.containerBlackColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: icon ??
                      Icon(Icons.menu,
                          color: MyColors.whiteTextColor,
                          size: context.getHeightScreen(height: 0.05)),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.showScreen(const ExploreScreen());
                      },
                      icon: icon2 ??
                          Icon(Icons.search,
                              color: MyColors.whiteTextColor,
                              size: context.getHeightScreen(height: 0.05)),
                    ),
                    IconButton(
                      onPressed: () {
                        context.showScreen(const NewPost());
                      },
                      icon: icon3 ??
                          Icon(Icons.add,
                              color: MyColors.whiteTextColor,
                              size: context.getHeightScreen(height: 0.05)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: color2 ?? MyColors.containerBlackColor,
            height: context.getHeightScreen(height: 0.08),
            child: child ??
                const TabBar(
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
            child: child2 ??
                const TabBarView(
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
