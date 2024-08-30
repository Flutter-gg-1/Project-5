import 'package:flutter/material.dart';
import 'package:project5/screens/home_screen.dart';

class UserScreenNavigator extends StatefulWidget {
  const UserScreenNavigator({super.key});

  @override
  State<UserScreenNavigator> createState() => _UserScreenNavigatorState();
}

class _UserScreenNavigatorState extends State<UserScreenNavigator> {
  
  List<Widget> screens = [const HomeScreen(), const Placeholder(), const Placeholder(), const Placeholder()];
  List<String> labels = ['Feed', 'Explore', 'Saved', 'Profile'];
  List<IconData> icons = [Icons.newspaper, Icons.explore_outlined, Icons.bookmark_border, Icons.person_2_outlined];
  int currentPage = 0;
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