import 'package:blog_app_project/screens/explore_screen.dart';
import 'package:blog_app_project/screens/home_screen.dart';
import 'package:blog_app_project/screens/profile_screen.dart';
import 'package:blog_app_project/screens/saved_screen.dart';
import 'package:flutter/material.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key});

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int indexScreens = 0;

  List<Widget> screens = const [
    HomeScreen(),
    ExploreScreen(),
    SavedScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        selectedIndex: indexScreens,
        backgroundColor: const Color(0xff131313),
        onDestinationSelected: (index) {
          setState(() {
            indexScreens = index;
          });
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.featured_play_list_outlined), label: 'feed'),
          NavigationDestination(
              icon: Icon(Icons.featured_play_list_outlined), label: 'feed'),
          NavigationDestination(
              icon: Icon(Icons.featured_play_list_outlined), label: 'feed'),
          NavigationDestination(
              icon: Icon(Icons.featured_play_list_outlined), label: 'feed'),
        ],
      ),
      body: screens[indexScreens],
    );
  }
}
