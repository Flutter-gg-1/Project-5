import 'package:flutter/material.dart';

import 'bottom_navigation_bar_screens/explore_screen.dart';
import 'bottom_navigation_bar_screens/feed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screens = [
    const FeedScreen(),
    const ExploreScreen(),
    const Text("data3",  style: TextStyle(color: Color(0xffffffff))),
    const Text("data4",  style: TextStyle(color: Color(0xffffffff))),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xffffffff),
        unselectedItemColor: const Color(0xff595959),
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
        BottomNavigationBarItem(icon: const Icon(Icons.feed_outlined), label: "Feed", backgroundColor:  const Color(0xff111111).withOpacity(0.8)),
        BottomNavigationBarItem(icon: const Icon(Icons.explore_outlined), label: "Explore", backgroundColor:  const Color(0xff111111).withOpacity(0.8)),
        BottomNavigationBarItem(icon: const Icon(Icons.bookmark_border_rounded), label: "Saved", backgroundColor:  const Color(0xff111111).withOpacity(0.8)),
        BottomNavigationBarItem(icon: const Icon(Icons.person_outline_outlined), label: "Profile", backgroundColor:  const Color(0xff111111).withOpacity(0.8)),
      ]),
      body: Center(child: screens.elementAt(currentIndex)),
    );
  }
}