import 'package:blog_app/screens/custom_bottomnavigation.dart';
import 'package:blog_app/widgets/tab_body.dart';
import 'package:flutter/material.dart';

import '../styles/colours.dart';
import 'explore_screen.dart';
import 'profile_screen.dart';
import 'saved_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late List<Widget> tabs;
  List pages = [HomeScreen(), ExploreScreen(), SavedScreen(), ProfileScreen()];
  int pageIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    tabs = [
      const Text('Tech'),
      const Text('AI'),
      const Text('Cloud'),
      const Text(
        'Robotics',
        style: TextStyle(fontSize: 16),
      ),
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
        actions: const [
          Icon(
            Icons.search,
            color: Colours.iconPrimary,
          ),
          // if(isLoggedIn)
          Icon(Icons.add, color: Colours.iconPrimary)
        ],
        bottom: TabBar(controller: tabController, tabs: tabs),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TabBarView(controller: tabController, children: const [
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
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colours.surfaceNavBar,
        unselectedItemColor: Colours.iconDisabled,
        selectedItemColor: Colours.iconSecondary,
        currentIndex: pageIndex,
        onTap: (index) {
          if (pageIndex != index) {
            setState(() {
              pageIndex = index;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => pages[pageIndex]));
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
