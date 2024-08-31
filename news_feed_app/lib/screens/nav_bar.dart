import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_feed_app/screens/explore.dart';
import 'package:news_feed_app/screens/feed.dart';
class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeedPage(),
    ExplorePage(),
    FeedPage(),
    FeedPage(),
    
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({super.key, required this.selectedIndex, required this.onItemTapped});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor:  const Color(0xff111111),
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/feed.svg',
            color: selectedIndex == 0 ? const Color(0xffffffff) :const Color(0xff595959),
          ),
          label: 'Feed',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/explore.svg',
            color: selectedIndex == 1 ? const Color(0xffffffff) :const Color(0xff595959),
          ),
          label: 'Explore',
        ),
        const BottomNavigationBarItem(
          icon:  Icon(Icons.bookmark_border,),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/profile.svg',
            color: selectedIndex == 3 ? const Color(0xffffffff) :const Color(0xff595959),
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor:  const Color(0xffffffff),
      unselectedItemColor: const Color(0xff595959),
      onTap: onItemTapped,
    );
  }
}