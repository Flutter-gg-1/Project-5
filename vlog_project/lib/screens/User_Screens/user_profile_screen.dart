import 'dart:io'; // Add this import for using File
import 'package:flutter/material.dart';
import 'package:vlog_project/model/blog_model.dart';
import 'package:vlog_project/screens/User_Screens/edit_page_screen.dart';
import 'package:vlog_project/screens/auth/log_in_screen.dart';
import 'package:vlog_project/service/blog_service.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({super.key});

  @override
  _UserAccountScreenState createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  final BlogService _blogService = BlogService();
  late List<Blog> _blogs;

  @override
  void initState() {
    super.initState();
    _loadBlogs();
  }

  void _loadBlogs() {
    setState(() {
      _blogs = _blogService.getBlogs();
    });
  }

  void _deleteBlog(Blog blog) {
    setState(() {
      _blogService.deleteBlog(blog.id);
      _blogs = _blogService.getBlogs(); // Refresh the blog list after deletion
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/profile_page.png",
                  height: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: const [
                    Text(
                      "Najwa Aldahri",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Software developer",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'My Blogs',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _blogs.isEmpty
                  ? const Center(
                      child: Text(
                        'No blogs available',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _blogs.length,
                      itemBuilder: (context, index) {
                        final blog = _blogs[index];
                        return Card(
                          color: const Color(0xff1E1E1E),
                          child: ListTile(
                            leading: SizedBox(
                              width: 60,
                              height: 60,
                              child: blog.imageUrl.isNotEmpty
                                  ? Image.file(
                                      File(blog.imageUrl),
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Placeholder(
                                        fallbackHeight: 60,
                                        fallbackWidth: 60,
                                        color: Colors.grey,
                                      ),
                                    )
                                  : const Placeholder(
                                      fallbackHeight: 60,
                                      fallbackWidth: 60,
                                      color: Colors.grey,
                                    ),
                            ),
                            title: Text(
                              blog.title,
                              style: const TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              blog.summary,
                              style: const TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditPage(blog: blog),
                                      ),
                                    ).then((result) {
                                      if (result == true) {
                                        _loadBlogs(); // Refresh the blog list after editing
                                      }
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () => _deleteBlog(blog),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Center(
              child: SizedBox(
                width: 173,
                height: 35,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFFFFFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text(
                    "Log out",
                    style: TextStyle(
                        color: Color(0xffDD403C), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
