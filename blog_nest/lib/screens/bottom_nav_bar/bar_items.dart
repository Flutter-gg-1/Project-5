import 'package:flutter/material.dart';
import '../account/account_screen.dart';
import '../bookmarks/bookmarks_screen.dart';
import '../explore/explore_screen.dart';
import '../home/home_screen.dart';

enum BarItems { home, explore, bookmark, profile }

extension BarItemValues on BarItems {
  Widget screen() {
    switch (this) {
      case BarItems.home:
        return const HomeScreen();
      case BarItems.explore:
        return const ExploreScreen();
      case BarItems.bookmark:
        return const BookmarksScreen();
      case BarItems.profile:
        return const AccountScreen();
    }
  }

  BottomNavigationBarItem navItem() {
    switch (this) {
      case BarItems.home:
        return const BottomNavigationBarItem(
          icon: Icon(Icons.feed),
          label: 'Feed',
          backgroundColor: Colors.transparent,
        );
      case BarItems.explore:
        return const BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
          backgroundColor: Colors.transparent,
        );
      case BarItems.bookmark:
        return const BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_outline),
          label: 'Saved',
          backgroundColor: Colors.transparent,
        );
      case BarItems.profile:
        return const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
          backgroundColor: Colors.transparent,
        );
    }
  }
}
