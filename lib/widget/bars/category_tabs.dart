
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  final Function(int)? onTap;
  const CategoryTabs({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 32),
      child: DefaultTabController(
          length: 5,
          child: ButtonsTabBar(
              onTap: onTap,
              labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffA48BE2)),
              unselectedBackgroundColor: const Color(0xff595959),
              backgroundColor: Colors.white,
              radius: 0,
              height: 26,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              buttonMargin: const EdgeInsets.symmetric(horizontal: 10),
              tabs: const [
                Tab(
                  text: 'Technology',
                ),
                Tab(
                  text: 'AI',
                ),
                Tab(
                  text: 'Cloud',
                ),
                Tab(
                  text: 'Robotic',
                ),
                Tab(
                  text: 'IoT',
                ),
              ])),
    );
  }
}
