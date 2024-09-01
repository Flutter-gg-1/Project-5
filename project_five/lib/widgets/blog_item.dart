import 'package:blogs_app/models/blog.dart';
import 'package:blogs_app/screens/blog_detail_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class BlogItem extends StatelessWidget {
  final Blog blog;
  final Function(Blog) onEdit;
  final Function(Blog) onDelete;

  const BlogItem({
    required this.blog,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogDetailScreen(blog: blog),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${blog.date} • ${blog.minutesToRead} mins",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.white),
                        onPressed: () => onEdit(blog),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => onDelete(blog),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
