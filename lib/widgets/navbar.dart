import 'package:blog_app/screens/explore_screen.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/screens/profile_screen.dart';
import 'package:blog_app/screens/save_list_screen.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List pages = [
    const HomeScreen(),
    const ExploreScreen(),
    const SaveListScreen(),
    const ProfileScreen(),
  ];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff111111),
          currentIndex: pageIndex,
          selectedItemColor: Colors.white,
        
          unselectedItemColor: const Color(0xff595959),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Feed"),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border), label: "Saved"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "Profile"),
          ],
          onTap: (int index) {
            pageIndex = index;
            setState(() {});
          },
        ),
      ),
      body: pages[pageIndex],
    );
  }
}
