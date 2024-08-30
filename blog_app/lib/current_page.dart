import 'package:blog_app/screens/explore_screen.dart';
import 'package:blog_app/screens/feed_screen.dart';
import 'package:blog_app/screens/profile_screen.dart';
import 'package:blog_app/screens/saved_screen.dart';
import 'package:flutter/material.dart';

class CurrentPage extends StatefulWidget {
  const CurrentPage({super.key});

  @override
  State<CurrentPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CurrentPage> {
  int currentNavIndex = 0;
  List pages = [
    const FeedScreen(),
    const ExploreScreen(),
    const SavedScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentNavIndex],
      bottomNavigationBar: Container(
        color: const Color(0xff111111),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xff111111),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xff595959),
          currentIndex: currentNavIndex,
          onTap: (index) {
            setState(() {
              currentNavIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          iconSize: 27,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.feed_sharp),
              label: "Feed",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border_outlined), label: "Saved"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "Profile")
          ],
        ),
      ),
    );
  }
}
