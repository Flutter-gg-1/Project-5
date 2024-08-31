import 'package:blog_app/data_layer/blog_data.dart';
import 'package:blog_app/extension/size_config.dart';
import 'package:blog_app/src/explore_screen.dart';
import 'package:blog_app/src/feed_screen.dart';
import 'package:blog_app/src/post_screen.dart';
import 'package:blog_app/src/profile_screen.dart';
import 'package:blog_app/src/saved_blog_screen.dart';
import 'package:blog_app/widget/bars/bottom_nav_bar.dart';
import 'package:blog_app/widget/bars/custom_app_bar.dart';
import 'package:blog_app/widget/card/blog_card.dart';
import 'package:blog_app/widget/slider/image_slider.dart';
import 'package:blog_app/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> screen = const [
    FeedScreen(),
    ExploreScreen(),
    SavedBlogScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: _selectedIndex == 0
            ? customAppBar(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PostScreen(),
                    )).then((value) {
                  if (value == true) {
                    setState(() {});
                  }
                }),
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xff595959),
            currentIndex: _selectedIndex,
            onTap: (value) => setState(() {
                  _selectedIndex = value;
                }),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesome.newspaper), label: 'Feed'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border_rounded), label: 'Saved'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_sharp), label: 'Profile'),
            ]),
        body: screen[_selectedIndex],

      ),
    );
  }
}