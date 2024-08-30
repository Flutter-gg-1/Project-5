import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          leading: const Icon(
            MingCute.menu_line,
          ),
          actions: const [
            Icon(
              Iconsax.search_normal_1_outline,
            ),
            SizedBox(
              width: 16,
            ),
            Icon(
              Iconsax.add_outline,
            ),
            SizedBox(
              width: 6.5,
            ),
          ],
          bottom: const TabBar(
              labelStyle: TextStyle(color: Colors.white),
              indicatorColor: Color(0xffDD403C),
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: [
                SizedBox(
                  width: 60,
                  height: 40,
                  child: Center(
                    child: Text(
                      'Tech',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      'AI',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Text(
                  'Cloud',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Robotics',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'IoT',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xff595959),
          items: const [
            BottomNavigationBarItem(icon: Icon(FontAwesome.newspaper),label: 'Feed'),
            BottomNavigationBarItem(icon: Icon(Icons.explore_outlined),label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark_border_rounded),label: 'Saved'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_sharp),label: 'Profile'),
          ]),
      ),
    );
  }
}
