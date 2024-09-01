import 'package:flutter/material.dart';
import 'package:vlog_project/model/blog_model.dart';
import 'package:vlog_project/screens/User_Screens/edit_page_screen.dart';

class UserBlogPage extends StatelessWidget {
  final Blog blog;

  const UserBlogPage({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(blog: blog),
                ),
              ).then((result) {
                if (result == true) {
                
                }
              });
            },
            icon: const Icon(Icons.edit_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (blog.imageUrl.isNotEmpty)
                Image.asset(
                  blog.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 20),
              Text(
                blog.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                blog.summary,
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                blog.content,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
