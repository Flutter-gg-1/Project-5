import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:blog_app/screens/explore_screen.dart';
import 'package:blog_app/screens/feed_screen.dart';
import 'package:blog_app/screens/profile_screen.dart';
import 'package:blog_app/screens/saved_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonNavBar extends StatefulWidget {
  const ButtonNavBar({super.key});

  @override
  State<ButtonNavBar> createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<ButtonNavBar> {
  int _currentIndex = 0;
  late final List<Widget> screens;
  @override
  void initState() {
    super.initState();
    screens = [
      const FeedScreen(),
      const ExploreScreen(),
      const SavedScreen(),
      const ProfileScreen(),
    ];
  }

  void onTap(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 24,
          selectedLabelStyle: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          selectedItemColor: ColorExt.white,
          unselectedItemColor: ColorExt.greyOpc,
          currentIndex: _currentIndex,
          onTap: onTap,
          backgroundColor: ColorExt.bottomBar,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.feed_outlined,
              ),
              label: "Feed",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore_outlined,
              ),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_border_outlined,
              ),
              label: "Saved",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
              ),
              label: "Profile",
            ),
          ],
        ));
  }
}
