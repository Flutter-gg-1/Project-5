import 'package:blogs_app/models/blog.dart';
import 'package:flutter/material.dart';
import 'blog_item.dart';

class BlogsList extends StatelessWidget {
  final List<Blog> blogs;
  final Function(Blog) onEdit;
  final Function(Blog) onDelete;

  const BlogsList({
    required this.blogs,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        Blog blog = blogs[index];
        return BlogItem(blog: blog, onEdit: onEdit, onDelete: onDelete);
      },
    );
  }
}
