import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_5/src/data_layer/post_data.dart';
import 'package:project_5/src/home/add_post_.dart';
import 'package:project_5/src/home/screens/explore_screen.dart';
import 'package:project_5/src/home/screens/feed_screen.dart';
import 'package:project_5/src/home/screens/profilescreen.dart';
import 'package:project_5/src/home/screens/saved_screen.dart';
import 'package:project_5/src/widget/tab_bar_catogray.dart';

class GuestHomeScreen extends StatefulWidget {
  const GuestHomeScreen({super.key});

  @override
  _GuestHomeScreenState createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen>
    with SingleTickerProviderStateMixin {
  var posts = GetIt.I.get<PostData>().allPost;

  TabController? _tabController;
  int selectedIndex = 0;

  final List<Widget> screens = [
    FeedScreen(),
    SearchScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 30,
            ),
            //   IconButton(
            //   alignment: Alignment.topLeft,
            //   iconSize: 30,
            //   icon: const Icon(Icons.add),
            //   onPressed: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (context) => AddPost()));
            //   },
            // ),
            

            // Show tab_bar_catogray only when FeedScreen is selected
            if (selectedIndex == 0)
              Container(
                color: Colors.black,
                child: tab_bar_catogray(tabController: _tabController),
              ),
            Expanded(
              child: screens[selectedIndex], // Display the selected screen
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.feed),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}


