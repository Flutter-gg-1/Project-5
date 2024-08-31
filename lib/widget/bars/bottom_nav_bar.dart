import 'package:blog_app/src/explore_screen.dart';
import 'package:blog_app/src/home_screen.dart';
import 'package:blog_app/src/profile_screen.dart';
import 'package:blog_app/src/saved_blog_screen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;
  List<Widget> screen = const [
    HomeScreen(),
    ExploreScreen(),
    SavedBlogScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xff595959),
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() {
          _selectedIndex =value;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesome.newspaper), label: 'Feed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_rounded), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp), label: 'Profile'),
        ]);
  }
}
