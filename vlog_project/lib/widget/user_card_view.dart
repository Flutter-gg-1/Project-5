import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vlog_project/model/blog_model.dart';

class UserCardView extends StatelessWidget {
  final Blog blog;
  final Function()? onSave;
  final Function()? onDelete;
  final Function()? onTap;

  const UserCardView({
    Key? key,
    required this.blog,
    this.onSave,
    this.onDelete,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xff1E1E1E),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: blog.imageUrl.isNotEmpty
                        ? Image.file(
                            File(blog.imageUrl),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
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
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.title,
                        style: const TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        blog.summary,
                        style: const TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "${blog.date.toLocal()} • ${blog.minutesToRead} min read",
                  style: const TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                if (onSave != null)
                  IconButton(
                    icon: const Icon(Icons.bookmark_border, color: Colors.grey),
                    onPressed: onSave,
                  ),
                if (onDelete != null)
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: onDelete,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
