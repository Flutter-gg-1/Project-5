import 'package:blog_app/models/blog.dart';
import 'package:blog_app/screens/blog_screen.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  // final String image;
  // final String author;
  // final String title;
  // final String date;
  // final int minToRead;
  final Blog blog;
  const BlogCard({
    super.key,
    required this.blog,
    // required this.image,
    // required this.author,
    // required this.title,
    // required this.date,
    // required this.minToRead
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BlogScreen(blog: blog,);
            }));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: const Color(0xff1E1E1E),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 62,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          blog.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(blog.authorName,
                            style: const TextStyle(
                              color: Color(0xffB8B8B8),
                            )),
                        SizedBox(
                          width: 240,
                          child: Text(blog.title,
                              style: const TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("${blog.date} • ${blog.minToRead} min read",
                            style: const TextStyle(
                              color: Color(0xffB8B8B8),
                              fontSize: 10,
                            ))
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.bookmark_outline_outlined,
                          color: Color(0xffB8B8B8),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Color(0xffB8B8B8),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
