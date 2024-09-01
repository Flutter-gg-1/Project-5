import 'dart:io';

import 'package:blogs_app/screens/explore_screen.dart';
import 'package:blogs_app/widgets/customSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../helper/locator.dart';
import 'add_blog_screen.dart';
import 'blog_detail_screen.dart';
import '../data/services/auth_service.dart';
import '../data/services/blog_service.dart';
import '../models/blog.dart';

class FeedScreen extends StatefulWidget {
  @override
  FeedScreenState createState() => FeedScreenState();
}

class FeedScreenState extends State<FeedScreen>
    with SingleTickerProviderStateMixin {
  final BlogService blogService = locator<BlogService>();
  final AuthService authService = locator<AuthService>();
  List<Blog> blogs = [];
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    loadBlogs();
    tabController = TabController(length: 5, vsync: this);
  }

  void loadBlogs() {
    setState(() {
      blogs = blogService.getBlogs();
    });
  }

  void navigateToAddBlogScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddBlogScreen()),
    );
    loadBlogs();
  }

  List<Blog> filterBlogsByCategory(String category) {
    return blogs
        .where((blog) => blog.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    bool isGuest = authService.isGuest();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.format_list_bulleted_rounded),
        backgroundColor: Color.fromRGBO(30, 30, 30, 1),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExploreScreen(),
                    ),
                  );
                },
              ),
              if (!isGuest)
                IconButton(
                    icon: Icon(Icons.add), onPressed: navigateToAddBlogScreen),
            ],
          ),
        ],
        bottom: TabBar(
          dividerColor: Colors.transparent,
          indicatorColor: Color.fromRGBO(221, 64, 60, 1),
          labelStyle: TextStyle(color: Colors.white),
          unselectedLabelColor: Color.fromRGBO(255, 255, 255, 0.1),
          controller: tabController,
          tabs: [
            Tab(text: 'TECHNOLOGY'),
            Tab(text: 'AI'),
            Tab(text: 'CLOUD'),
            Tab(text: 'ROBOTIC'),
            Tab(text: 'IOT'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          buildBlogList('TECHNOLOGY'),
          buildBlogList('AI'),
          buildBlogList('CLOUD'),
          buildBlogList('ROBOTIC'),
          buildBlogList('IOT'),
        ],
      ),
    );
  }

  Widget buildBlogList(String category) {
    List<Blog> filteredBlogs = filterBlogsByCategory(category);
    List<Blog> sliderBlogs = filteredBlogs.take(3).toList();
    return filteredBlogs.isEmpty
        ? Center(
            child: Text(
              'No blogs available in $category.',
              style: TextStyle(color: Colors.white),
            ),
          )
        : Column(
            children: [
              if (sliderBlogs.isNotEmpty) CustomImageSlider(blogs: sliderBlogs),
              Divider(
                color: Color.fromRGBO(136, 136, 136, 1),
                endIndent: 5,
                indent: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Stories",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          color: Color.fromRGBO(136, 136, 136, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredBlogs.length,
                  itemBuilder: (context, index) {
                    Blog blog = filteredBlogs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(30, 30, 30, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.file(
                                  File(blog.postImage),
                                  height: 62,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                blog.authorName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                blog.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BlogDetailScreen(blog: blog),
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(16.0, 6, 16, 6),
                              child: Row(
                                children: [
                                  Text(
                                    "${blog.date} • ${blog.minutesToRead} min Read",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      blog.isSaved
                                          ? Icons.bookmark
                                          : Icons.bookmark_border,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (!blog.isSaved) {
                                          blogService.saveBlog(blog);
                                          blog.isSaved = true;
                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(width: 16),
                                  Icon(Icons.more_vert, color: Colors.white),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
