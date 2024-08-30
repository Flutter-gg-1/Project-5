import 'package:flutter/material.dart';
import 'package:vlog_project/Guest_Screens/explore_guest_screen.dart';
import 'package:vlog_project/Guest_Screens/guest_home.dart';
import 'package:vlog_project/Guest_Screens/guest_profile_screen.dart';
import 'package:vlog_project/Guest_Screens/saved_guest_screen.dart';
import 'package:vlog_project/Guest_Screens/tap_bar_content/Tech_content_screen.dart';
import 'package:vlog_project/Guest_Screens/tap_bar_content/ai_content_screen.dart';
import 'package:vlog_project/Guest_Screens/tap_bar_content/cloud_content_screen.dart';
import 'package:vlog_project/Guest_Screens/tap_bar_content/iot_content_screen.dart';
import 'package:vlog_project/Guest_Screens/tap_bar_content/robotics_content_screen.dart';
import 'package:vlog_project/User_Screens/add_nwes_screen.dart';
import 'package:vlog_project/helper/navigation.dart'; // Assuming this is a custom navigation helper

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int _selectedIndex = 0;

  // List of widgets representing different pages for each BottomNavigationBar item
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();

    // Initialize pages inside initState
    _pages.addAll([
      DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: const Color(0xff111111),
          appBar: AppBar(
            backgroundColor: const Color(0xff1E1E1E),
            leading: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            actions: [
              const Icon(
                Icons.search,
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  // Use Navigator.push or your custom navigation
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddNewScreen()),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.red,
              tabs: [
                Tab(text: "Tech"),
                Tab(text: "AI"),
                Tab(text: "Cloud"),
                Tab(text: "Robotics"),
                Tab(text: "IoT"),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TechContentScreen(),
              AiContntScreen(),
              CloudContentScreen(),
              RoboticsContentScreen(),
              IotContentScreen(),
            ],
          ),
        ),
      ),
      const ExploreGuestScreen(),
      const SavedGuestScreen(),
      const GuestProfileScreen(),
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: _pages[
          _selectedIndex], // Switch between screens based on selected tab
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff1E1E1E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


