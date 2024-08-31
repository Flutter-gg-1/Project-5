import 'package:flutter/material.dart';
import '../../extensions/color_ext.dart';
import 'bar_items.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int _currentIndex = 0;
  final List<Widget> _screens =
      BarItems.values.map((item) => item.screen()).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        selectedItemColor: C.text1,
        unselectedItemColor: C.text3,
        unselectedLabelStyle: const TextStyle(color: C.text3),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: BarItems.values.map((item) => item.navItem()).toList(),
      ),
    );
  }
}
