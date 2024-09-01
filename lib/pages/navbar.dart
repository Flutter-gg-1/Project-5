import 'package:flutter/material.dart';
import 'package:project_5/pages/account_page.dart';
import 'package:project_5/pages/explore_page.dart';
import 'package:project_5/pages/home_screen.dart';
import 'package:project_5/pages/saved_page.dart';
import 'package:animations/animations.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const ExplorePage(),
     const SavedPage(),
    const AccountPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700);
            }
            return const TextStyle(
              color: Color(0xff595959),
              fontWeight: FontWeight.normal,
            );
          }),
        ),
        child: NavigationBar(
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
                color: _selectedIndex == 0
                    ? Colors.white
                    : const Color(0xff595959),
              ),
              label: "Feed",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.explore,
                size: 24,
                color: _selectedIndex == 1
                    ? Colors.white
                    : const Color(0xff595959),
              ),
              label: "Explore",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.bookmark_border,
                size: 24,
                color: _selectedIndex == 2
                    ? Colors.white
                    : const Color(0xff595959),
              ),
              label: "Saved",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.account_circle_rounded,
                size: 24,
                color: _selectedIndex == 3
                    ? Colors.white
                    : const Color(0xff595959),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, animation, secondaryAnimation) {
          return FadeScaleTransition(
            animation: animation,
            child: child,
          );
        },
        child: pages[_selectedIndex],
      ),
    );
  }

  
}
