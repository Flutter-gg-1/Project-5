import 'dart:io';

import 'package:blogs_app/data/services/auth_service.dart';
import 'package:blogs_app/data/services/blog_service.dart';
import 'package:blogs_app/helper/locator.dart';
import 'package:flutter/material.dart';
import '../models/blog.dart';
import 'edit_blog_screen.dart';

class BlogDetailScreen extends StatefulWidget {
  final Blog blog;

  BlogDetailScreen({required this.blog});

  @override
  _BlogDetailScreenState createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  final BlogService blogService = locator<BlogService>();
  final AuthService authService = locator<AuthService>();

  @override
  Widget build(BuildContext context) {
    bool isGuest = authService.isGuest();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          if (!isGuest) ...[
            IconButton(
              icon: Icon(Icons.sort_by_alpha_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                widget.blog.isSaved ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  if (!widget.blog.isSaved) {
                    blogService.saveBlog(widget.blog);
                    widget.blog.isSaved = true;
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditBlogScreen(blog: widget.blog),
                  ),
                );
              },
            ),
          ],
          if (isGuest) ...[
            IconButton(
              icon: Icon(Icons.sort_by_alpha_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                widget.blog.isSaved ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  if (!widget.blog.isSaved) {
                    blogService.saveBlog(widget.blog);
                    widget.blog.isSaved = true;
                  }
                });
              },
            ),
          ]
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.file(File(widget.blog.postImage)),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(widget.blog.category,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(189, 166, 245, 1),
                        fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(widget.blog.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Image.asset("assets/images/Vector.png")),
              ),
              SizedBox(height: 10),
              Text('${widget.blog.authorName}',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(184, 184, 184, 1))),
              SizedBox(height: 10),
              Text(
                  "${widget.blog.date} • ${widget.blog.minutesToRead.toString()} mins",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(184, 184, 184, 1))),
              Row(
                children: [
                  Icon(Icons.facebook, color: Color.fromRGBO(184, 184, 184, 1)),
                  Image.asset(
                    "assets/icons/twitter_icon.png",
                    color: Color.fromRGBO(184, 184, 184, 1),
                    scale: 2,
                  ),
                  Icon(Icons.link, color: Color.fromRGBO(184, 184, 184, 1))
                ],
              ),
              SizedBox(height: 20),
              Text('Summary',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              SizedBox(height: 10),
              Text(
                widget.blog.summary,
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(184, 184, 184, 1),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Text('Content',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)),
              SizedBox(height: 10),
              Text(
                widget.blog.content,
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(184, 184, 184, 1),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
