import 'package:flutter/material.dart';
import 'package:project/gust_page/gust_Page.dart';
import 'package:project/profaile.dart/profaile.dart';
import 'package:project/saved/saved.dart';
import 'package:project/search/search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  // List of pages
  final List<Widget> _pages = [const GustPage(), Search(), Saved(), Profaile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff181610),
        selectedItemColor: const Color(0xffe8e8e8),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.feed_outlined), label: 'Feed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'Profaile'),
        ],
      ),
    );
  }
}
