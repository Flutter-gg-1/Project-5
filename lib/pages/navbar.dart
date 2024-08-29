import 'package:flutter/material.dart';
import 'package:project_5/pages/account_page.dart';
import 'package:project_5/pages/explore_page.dart';
import 'package:project_5/pages/home_screen.dart';
import 'package:project_5/pages/saved_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  List<Widget> pages = const [
    HomeScreen(),
    ExplorePage(),
    SavedPage(),
    AccountPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        backgroundColor: const Color(0xff131313),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.feed,
              size: 24,
              color:
                  _selectedIndex == 0 ? Colors.white : const Color(0xff595959),
            ),
            label: "Feed",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.explore,
              size: 24,
              color:
                  _selectedIndex == 1 ? Colors.white : const Color(0xff595959),
            ),
            label: "Explore",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.bookmark_border,
              size: 24,
              color:
                  _selectedIndex == 2 ? Colors.white : const Color(0xff595959),
            ),
            label: "Saved",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.account_circle_rounded,
              size: 24,
              color:
                  _selectedIndex == 3 ? Colors.white : const Color(0xff595959),
            ),
            label: "Profile",
          ),
        ],
      ),
      body: pages[_selectedIndex],
    );
  }
}
