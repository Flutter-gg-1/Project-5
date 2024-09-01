import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project/User_task/user_task.dart';


import 'package:project/gust_page/image_slider.dart';
import 'package:project/gust_page/posts/edit_post/add_post.dart';
import 'package:project/gust_page/tab_view.dart';

class GustPage extends StatelessWidget {
  const GustPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserTask userTask = GetIt.I<UserTask>();
    final userData = userTask.loadUserData();

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xff111111),
        appBar: AppBar(
          backgroundColor: const Color(0xff181610),
          leading: Image.asset('lib/gust_page/images/Icons.png'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Implement search functionality if needed
              },
            ),
            if (userData.flag)
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const EditPost(), 
                    ),
                  );
                },
              ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.red,
            labelColor: Color(0xffe8e8e8),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Tech'),
              Tab(text: 'AI'),
              Tab(text: 'Cloud'),
              Tab(text: 'Robotics'),
              Tab(text: 'IoT'),
            ],
          ),
        ),
        drawer: const Drawer(
          backgroundColor: Color(0xff1E1E1E),
        ),
        body: Column(
          children: const [
            ImageSlider(),
            Divider(
              endIndent: 16,
              indent: 16,
            ),
            Expanded(child: CustomTabView()),
          ],
        ),
      ),
    );
  }
}
