import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project/User_task/user_task.dart';
import 'package:project/profaile.dart/blogs.dart';

class Profaile extends StatefulWidget {
  const Profaile({super.key});

  @override
  State<Profaile> createState() => _ProfaileState();
}

class _ProfaileState extends State<Profaile> {
  @override
  Widget build(BuildContext context) {
    final UserTask userTask = GetIt.I<UserTask>();
    final userData = userTask.loadUserData();
    
    final allPosts = userTask.loadAllPosts();
   
    final userPosts = allPosts
        .where((post) => post['username'] == userData.username)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff111111),
      ),
      body: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 23),
              child: Text(
                'Account',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          ListTile(
            leading: Image.asset('lib/profaile.dart/images/Profile.png'),
            title: Text(
              userData.username,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Software developer',
              style: TextStyle(color: Color(0xff8e8e8e)),
            ),
          ),
          const SizedBox(height: 43),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 23),
              child: Text(
                'Your Posts',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Expanded(
            child: userPosts.isEmpty
                ? const Center(
                    child: Text(
                      'No posts available',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : ListView.builder(
                    itemCount: userPosts.length,
                    itemBuilder: (context, index) {
                      return Blogs(
                        title: userPosts[index]['title'] ?? 'Untitled Post',
                        onDelete: () {
                          if (userData.username == 'user1' ||
                              userData.username == 'user2') {
                            userTask.removeUserPost(userData.username, index);

                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'You do not have permission to delete posts.'),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
          ),
          SizedBox(
            width: 255,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                final box = GetStorage();
                box.erase();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
