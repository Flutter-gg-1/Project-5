import 'package:flutter/material.dart';
import 'package:project5/screens/explore_screen.dart';
import 'package:project5/screens/feed_screen.dart';
import 'package:project5/screens/profile_screen.dart';
import 'package:project5/screens/saved_screen.dart';

class UserScreenNavigator extends StatefulWidget {
  final int? goTo;
  const UserScreenNavigator({super.key, this.goTo});

  @override
  State<UserScreenNavigator> createState() => _UserScreenNavigatorState();
}

class _UserScreenNavigatorState extends State<UserScreenNavigator> {
  List<Widget> screens = [const FeedScreen(), const ExploreScreen(), const SavedScreen(), const ProfileScreen()];
  List<String> labels = ['Feed', 'Explore', 'Saved', 'Profile'];
  List<IconData> icons = [Icons.newspaper, Icons.explore_outlined, Icons.bookmark_border, Icons.person_2_outlined];
  late int currentPage = widget.goTo ?? 0;
  Color currentColor = const Color(0xffe8e8e8);
  Color notCurrentColor = const Color(0xff595959);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPage],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.white, width: 0.2))),
        height: 88,
        child: Theme(
          data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
          child: BottomNavigationBar(
            currentIndex: currentPage,
            backgroundColor: const Color(0xff111111),
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: notCurrentColor,
            selectedItemColor: currentColor,
            items: List.generate(screens.length, (index){
              return BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Icon(icons[index], size: 24),
                ),
                label: labels[index],
              );
            }),
            onTap: (value) => setState(() => currentPage = value)
          ),
        ),
      ),
    );
  }
}