import 'package:blog_app/src/blog_screen.dart';
import 'package:blog_app/widget/text/custom_text.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String writer,
      title,
      timeToRead,
      creationDate,
      category,
      summary,
      content;
  final bool isFaveiorte;
  final int id;
  final Function()? onPressedBookMark;
  const BlogCard({
    super.key,
    required this.writer,
    required this.title,
    required this.timeToRead,
    required this.creationDate,
    required this.isFaveiorte,
    this.onPressedBookMark,
    required this.category,
    required this.summary,
    required this.content,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogScreen(
              id: id,
              category: category,
              title: title,
              writer: writer,
              time: timeToRead,
              date: creationDate,
              summary: summary,
              content: content,
              isFaveiorte: isFaveiorte,
            ),
          )),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.only(top: 8),
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xff1e1e1e)),
        child: Column(
          children: [
            ListTile(
              title: Text(
                writer,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6e6e6e)),
              ),
              subtitle: CustomText(text: title),
              leading: Container(
                width: 80,
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'Blog',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 13,
                ),
                Text(
                  '$creationDate • $timeToRead min read',
                  style: const TextStyle(color: Color(0xff6e6e6e)),
                ),
                const Spacer(),
                IconButton(
                    onPressed: onPressedBookMark,
                    icon: isFaveiorte
                        ? const Icon(
                            Icons.bookmark,
                            color: Colors.white,
                          )
                        : const Icon(Icons.bookmark_outline)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_rounded)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
