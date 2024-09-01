import 'package:blog_app/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blog_app/helper/extension/color_ext.dart';

class UserBlogsList extends StatelessWidget {
  final List<BlogModel> blogs;
  final Function(BlogModel) onEdit;
  final Function(BlogModel) onDelete;
  final Function()? onTap;

  const UserBlogsList({
    super.key,
    required this.blogs,
    required this.onEdit,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        final blog = blogs[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Card(
            color: ColorExt.leaden,
            child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.asset(
                  blog.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  blog.title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorExt.white,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: ColorExt.white),
                      onPressed: () => onEdit(blog),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: ColorExt.red),
                      onPressed: () => onDelete(blog),
                    ),
                  ],
                ),
                onTap: onTap),
          ),
        );
      },
    );
  }
}
