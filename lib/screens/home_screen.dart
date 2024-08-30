import 'package:blog_app/widgets/tab_body.dart';
import 'package:flutter/material.dart';

import '../styles/colours.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late List<Widget> tabs;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    tabs = [
      const Text('Tech'),
      const Text('AI'),
      const Text('Cloud'),
      const Text('Robotics'),
      const Text('IoT'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool isLoggedIn = false;
    return Scaffold(
      backgroundColor: Colours.surfaceSecondary,
      appBar: AppBar(
        backgroundColor: Colours.surfaceTertiary,
        leading: const Icon(Icons.menu, color: Colours.iconPrimary),
        actions: [
          const Icon(
            Icons.search,
            color: Colours.iconPrimary,
          ),
          // if(isLoggedIn)
          const Icon(Icons.add, color: Colours.iconPrimary)
        ],
        bottom: TabBar(controller: tabController, tabs: tabs),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TabBarView(controller: tabController, children: [
          TabBody(
            tabIndex: 0,
          ),
          Text('empty'),
          Text('empty'),
          Text('empty'),
          Text('empty'),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colours.surfaceNavBar,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.feed_outlined, color: Colours.iconDisabled,),label: 'Feed'),
        BottomNavigationBarItem(icon: Icon(Icons.explore_outlined, color: Colours.iconDisabled), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_border, color: Colours.iconDisabled), label: 'Saved'),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined, color: Colours.iconDisabled), label: 'Profile'),
      ]
      ),
    );
  }
}
