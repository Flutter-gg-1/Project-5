import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vlog_project/model/blog_model.dart';
import 'package:vlog_project/screens/User_Screens/user_explore_screen.dart';
import 'package:vlog_project/screens/User_Screens/user_profile_screen.dart';
import 'package:vlog_project/screens/User_Screens/user_saved_screen.dart';
import 'package:vlog_project/screens/User_Screens/add_nwes_screen.dart';
import 'package:vlog_project/screens/User_Screens/tap_bar_content/Tech_content_screen.dart';
import 'package:vlog_project/screens/User_Screens/tap_bar_content/ai_content_screen.dart';
import 'package:vlog_project/screens/User_Screens/tap_bar_content/cloud_content_screen.dart';
import 'package:vlog_project/screens/User_Screens/tap_bar_content/iot_content_screen.dart';
import 'package:vlog_project/screens/User_Screens/tap_bar_content/robotics_content_screen.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int _selectedIndex = 0;
  final box = GetStorage();

  late Future<List<Blog>> techBlogs;
  late Future<List<Blog>> aiBlogs;
  late Future<List<Blog>> cloudBlogs;
  late Future<List<Blog>> roboticsBlogs;
  late Future<List<Blog>> iotBlogs;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _loadBlogs();
  }

  Future<void> _loadBlogs() async {
    setState(() {
      techBlogs = _getBlogsByCategory('TECHNOLOGY');
      aiBlogs = _getBlogsByCategory('AI');
      cloudBlogs = _getBlogsByCategory('CLOUD');
      roboticsBlogs = _getBlogsByCategory('ROBOTICS');
      iotBlogs = _getBlogsByCategory('IOT');
    });
  }

  Future<List<Blog>> _getBlogsByCategory(String category) async {
    List<dynamic> allBlogs = box.read('blogs') ?? [];
    return allBlogs
        .map((data) => Blog.fromJson(data))
        .where((blog) => blog.category == category)
        .toList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _navigateToAddNewScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNewScreen()),
    );
    if (result == true) {
      _loadBlogs(); // Reload the blogs if a new one was added
    }
  }

  void _saveBlog(Blog blog) {
    setState(() {
      List<dynamic> savedBlogsJson = box.read('savedBlogs') ?? [];
      List<Blog> savedBlogs =
          savedBlogsJson.map((data) => Blog.fromJson(data)).toList();

      if (!savedBlogs.any((b) => b.id == blog.id)) {
        savedBlogs.add(blog);
        box.write('savedBlogs', savedBlogs.map((b) => b.toJson()).toList());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _pages = [
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
                onPressed: _navigateToAddNewScreen,
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
          body: TabBarView(
            children: [
              FutureBuilder<List<Blog>>(
                future: techBlogs,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading blogs.'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No blogs available.',style: TextStyle(color: Colors.white),));
                  }
                  return UserTechContentScreen(
                    blogs: snapshot.data!,
                    onSave: _saveBlog, // Pass save function here
                  );
                },
              ),
              FutureBuilder<List<Blog>>(
                future: aiBlogs,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading blogs.'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No blogs available.',style: TextStyle(color: Colors.white),));
                  }
                  return UserAiContentScreen(
                    blogs: snapshot.data!,
                    onSave: _saveBlog, // Pass save function here
                  );
                },
              ),
              FutureBuilder<List<Blog>>(
                future: cloudBlogs,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading blogs.'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No blogs available.',style: TextStyle(color: Colors.white),));
                  }
                  return UserCloudContentScreen(
                    blogs: snapshot.data!,
                    onSave: _saveBlog, // Pass save function here
                  );
                },
              ),
              FutureBuilder<List<Blog>>(
                future: roboticsBlogs,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading blogs.'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No blogs available.',style: TextStyle(color: Colors.white),));
                  }
                  return UserRoboticsContentScreen(
                    blogs: snapshot.data!,
                    onSave: _saveBlog, // Pass save function here
                  );
                },
              ),
              FutureBuilder<List<Blog>>(
                future: iotBlogs,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading blogs.'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No blogs available.',style: TextStyle(color: Colors.white),));
                  }
                  return UserIotContentScreen(
                    blogs: snapshot.data!,
                    onSave: _saveBlog, // Pass save function here
                  );
                },
              ),
            ],
          ),
        ),
      ),
      const ExploreUserScreen(),
      const UserSavedScreen(),
      UserAccountScreen(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff1E1E1E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 0) {
            _loadBlogs(); // Refresh blogs when navigating to the Feed tab
          }
          _onItemTapped(index);
        },
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
















