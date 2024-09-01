import 'package:flutter/material.dart';
import 'package:blog_app/data_layer/user_data.dart';
import 'package:blog_app/models/blog_model.dart';

class BlogManager {
  final UserData userData;

  BlogManager(this.userData);

  Future<void> toggleSave(BuildContext context, BlogModel blog) async {
    if (userData.currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please log in to save blogs.'),
        ),
      );
      return;
    }

    if (userData.isBlogSaved(blog)) {
      await userData.removeBlog(blog);
    } else {
      await userData.saveBlog(blog);
    }
  }
}
