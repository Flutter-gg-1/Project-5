import 'package:flutter/material.dart';

import 'bottom_navigation_bar_screens/explore_screen.dart';
import 'bottom_navigation_bar_screens/feed_screen.dart';
import 'bottom_navigation_bar_screens/profile_screen.dart';
import 'bottom_navigation_bar_screens/saved_screen.dart';
import 'package:animations/animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screens = [
    const FeedScreen(),
    const ExploreScreen(),
    SavedScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xffffffff),
        unselectedItemColor: const Color(0xff595959),
        unselectedLabelStyle: const TextStyle(color: Color(0xff595959)),
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.feed_outlined), label: "Feed", ),
        BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: "Explore", ),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_border_rounded), label: "Saved"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: "Profile"),
      ]),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, animation, secondaryAnimation) {
          return FadeScaleTransition(
            animation: animation,
            child: child,
          );
        },
        child: screens.elementAt(currentIndex),
      ),
    );
  }
}