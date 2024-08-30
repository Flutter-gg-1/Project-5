
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: const Color(0xff595959),
      
      items: const [
        BottomNavigationBarItem(icon: Icon(FontAwesome.newspaper),label: 'Feed'),
        BottomNavigationBarItem(icon: Icon(Icons.explore_outlined),label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_border_rounded),label: 'Saved'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp),label: 'Profile'),
      ]);
  }
}