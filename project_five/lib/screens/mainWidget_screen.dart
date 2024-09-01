import 'package:blogs_app/screens/explore_screen.dart';
import 'package:blogs_app/screens/feed_screen.dart';
import 'package:blogs_app/screens/profile_screen.dart';
import 'package:blogs_app/screens/savedBlogs_screen.dart';
import 'package:blogs_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  final List<Widget> screens = [
    FeedScreen(),
    ExploreScreen(),
    SavedBlogsScreen(),
    ProfilePage(),
  ];

  void onNavBarTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: screens,
        physics: BouncingScrollPhysics(),
  
        pageSnapping: false,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: selectedIndex,
        onTap: onNavBarTap,
      ),
    );
  }
}
