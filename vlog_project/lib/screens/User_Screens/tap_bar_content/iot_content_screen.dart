import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vlog_project/model/blog_model.dart';
import 'package:vlog_project/screens/Guest_Screens/full_page_news_screen.dart';
import 'package:vlog_project/screens/User_Screens/user_blog_page_screen.dart';
import 'package:vlog_project/widget/card_view_viedo.dart';
import 'package:vlog_project/widget/user_card_view.dart';

class UserIotContentScreen extends StatelessWidget {
    final List<Blog> blogs;
  final Function(Blog blog)? onSave;  // Add the onSave parameter

  const UserIotContentScreen({Key? key, required this.blogs, this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/drone_biger.png",
                      width: 430,
                    ),
                    const Positioned(
                      top: 160,
                      child: Text(
                        "  DJI • Jul 10, 2023",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Positioned(
                      top: 190,
                      child: Text(
                        "  A month with DJI Mini 3 Pro",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 180,
                      right: 10,
                      child: Icon(
                        Icons.arrow_outward_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(
              width: 450,
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Top Stories",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 300),
                Text(
                  "See all",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),
            for (var blog in blogs)
              Column(
                children: [
                  UserCardView(
                    blog: blog,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserBlogPage(blog: blog),
                        ),
                      );
                    },
                    onSave: onSave != null ? () => onSave!(blog) : null,  // Pass the onSave callback
                  ),
                  const SizedBox(height: 10),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
