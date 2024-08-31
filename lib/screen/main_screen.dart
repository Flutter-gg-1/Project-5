import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/all_file.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int bottomIndex = 0;

List<Widget> pagesNavigationBottomBar = [
  FeedScreen(),
  const ExploreScreen(),
  const SavedScreen(),
  const ProfileScreen(),
];

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesNavigationBottomBar[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: MyColors.containerBlackColor,
        selectedItemColor: MyColors.whiteTextColor,
        selectedFontSize: context.getHeightScreen(height: 0.02),
        unselectedItemColor: MyColors.greyTextColor,
        unselectedFontSize: context.getHeightScreen(height: 0.018),
        selectedIconTheme:
            IconThemeData(size: context.getHeightScreen(height: 0.05)),
        unselectedIconTheme:
            IconThemeData(size: context.getHeightScreen(height: 0.03)),
        currentIndex: bottomIndex,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.feed, color: MyColors.whiteTextColor),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined, color: MyColors.whiteTextColor),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border, color: MyColors.whiteTextColor),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user, color: MyColors.whiteTextColor),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
