import 'dart:io';
import 'package:flutter/material.dart';
import 'package:blogs_app/screens/blog_detail_screen.dart';
import '../data/services/blog_service.dart';
import '../helper/locator.dart';
import '../models/blog.dart';

class SavedBlogsScreen extends StatefulWidget {
  @override
  SavedBlogsScreenState createState() => SavedBlogsScreenState();
}

class SavedBlogsScreenState extends State<SavedBlogsScreen> {
  late BlogService blogService;
  late List<Blog> savedBlogs;

  @override
  void initState() {
    super.initState();
  blogService = locator<BlogService>();
    savedBlogs = blogService.getSavedBlogs();
  }

  void _removeBlog(int index) {
    Blog blog = savedBlogs[index];
    blogService.removeSavedBlog(blog.id); 
    setState(() {
      savedBlogs.removeAt(index); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(30, 30, 30, 1),
        title: Text(
          'Saved Blogs',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: savedBlogs.isEmpty
          ? Center(
              child: Text(
                'No saved blogs.',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: savedBlogs.length,
              itemBuilder: (context, index) {
                Blog blog = savedBlogs[index];
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
                            blog.summary,
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
                          trailing: IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _removeBlog(index);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 6, 16, 6),
                          child: Row(
                            children: [
                              Text(
                                "${blog.date} • ${blog.minutesToRead.toString()}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
