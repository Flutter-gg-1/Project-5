import 'package:flutter/material.dart';
import '../models/user.dart';
import '../screens/navigation_screens/explore_screen.dart';
import '../screens/navigation_screens/home_screen.dart';
import '../screens/navigation_screens/profile_screen.dart';
import '../screens/navigation_screens/saved_screen.dart';
import '../styles/colours.dart';

class CustomNavigation extends StatefulWidget {
  final User? user;
  const CustomNavigation({super.key, this.user});

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  late List pages;
  late int pageIndex;
  @override
  void initState() {
    pages = [
    HomeScreen(user: widget.user),
    ExploreScreen(),
    SavedScreen(),
    ProfileScreen()
  ];
  pageIndex = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
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
