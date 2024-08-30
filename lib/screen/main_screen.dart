import 'package:flutter/material.dart';
import '../core/all_file.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int bottomIndex = 0;

List<Widget> pagesNavigationBottomBar = const [
  FeedScreen(),
  SavedScreen(),
  ExploreScreen(),
  ProfileScreen(),
];

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: pagesNavigationBottomBar[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        selectedItemColor: MyColors.whiteTextColor,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: bottomIndex,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.feed, color: MyColors.whiteTextColor),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined,
                color: MyColors.whiteTextColor),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined, color: MyColors.whiteTextColor),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined, color: MyColors.whiteTextColor),
            label: '',
          ),
        ],
      ),
    );
  }
}
