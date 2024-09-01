import 'package:flutter/material.dart';
import 'package:news_feed_app/screens/blog.dart';
import 'package:news_feed_app/screens/edit_post.dart';

class ProfileStoryCard extends StatelessWidget {
  const ProfileStoryCard({
    super.key,
    required this.title,
    required this.imgPath,
    required this.id,
    required this.onEdit,
    required this.onDelete, 
  });

  final String title;
  final String imgPath;
  final int id; 
  final VoidCallback onEdit;
  final VoidCallback onDelete; // Create a callback for deleting

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xff1E1E1E),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlogPage(postId: id),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: 80,
                    height: 62,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Color(0xffffffff),
                    ),
                    child: Image.asset(imgPath, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffffffff),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.create_outlined, color: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EditPost(postId: id)),
                                ).then((value) {
                                  if (value == true) {
                                    onEdit();
                                  }
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outlined, color: Color(0xffDD403C)),
                              onPressed: () {
                                // Call the delete function
                                onDelete();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}