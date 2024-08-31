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
    ExplorePage(),
     SavedPage(),
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

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    final iconColor = isSelected ? Colors.blueAccent : Colors.black87;
    final double scaleFactor = isSelected ? 1.2 : 1.0;

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 1.0, end: scaleFactor),
      duration: const Duration(milliseconds: 300),
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            child: Icon(icon, size: 30, color: iconColor),
          ),
        );
      },
    );
  }
}
