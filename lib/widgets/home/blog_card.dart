import 'package:blog_app/data/user_data.dart';
import 'package:blog_app/models/blog.dart';
import 'package:blog_app/screens/blog_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BlogCard extends StatefulWidget {
  final Blog blog;
  final Function() onSaved;

  const BlogCard({
    super.key,
    required this.blog,
    required this.onSaved,
  });

  @override
  State<BlogCard> createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    isSaved = GetIt.I.get<UserData>().savedBlogs.contains(widget.blog);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BlogScreen(
                blog: widget.blog,
              );
            }));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color(0xff1E1E1E),
              borderRadius: BorderRadius.circular(8),
            ),
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
                          widget.blog.image,
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
                        Text(widget.blog.authorName,
                            style: const TextStyle(
                              color: Color(0xffB8B8B8),
                            )),
                        SizedBox(
                          width: 240,
                          child: Text(widget.blog.title,
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
                        Text(
                            "${widget.blog.date} • ${widget.blog.minToRead} min read",
                            style: const TextStyle(
                              color: Color(0xffB8B8B8),
                              fontSize: 10,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.onSaved();

                              isSaved = !isSaved;
                            });
                          },
                          icon: isSaved
                              ? const Icon(Icons.bookmark,
                                  color: Color(0xffB8B8B8))
                              : const Icon(Icons.bookmark_outline_outlined,
                                  color: Color(0xffB8B8B8)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.more_vert,
                          color: Color(0xffB8B8B8),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ],
                ),
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
              // TopStories(
              //   category: "TECHNOLOGY",
              //   onSaved: (Blog blog) {
              //     isSaved
              //         ? {
              //             GetIt.I.get<UserData>().savedBlogs.remove(blog),
              //             isSaved = !isSaved
              //           }
              //         : {
              //             GetIt.I.get<UserData>().savedBlogs.add(blog),
              //             isSaved = !isSaved
              //           };
              //   },
              // ),
              // TopStories(
              //   category: "AI",
              //   onSaved: (Blog blog) {
              //     isSaved
              //         ? {
              //             GetIt.I.get<UserData>().savedBlogs.remove(blog),
              //             isSaved = !isSaved
              //           }
              //         : {
              //             GetIt.I.get<UserData>().savedBlogs.add(blog),
              //             isSaved = !isSaved
              //           };
              //   },
              // ),
              // TopStories(
              //   category: "CLOUD",
              //   onSaved: (Blog blog) {
              //     isSaved
              //         ? {
              //             GetIt.I.get<UserData>().savedBlogs.remove(blog),
              //             isSaved = !isSaved
              //           }
              //         : {
              //             GetIt.I.get<UserData>().savedBlogs.add(blog),
              //             isSaved = !isSaved
              //           };
              //   },
              // ),
              // TopStories(
              //   category: "ROBOTICS",
              //   onSaved: (Blog blog) {
              //     isSaved
              //         ? {
              //             GetIt.I.get<UserData>().savedBlogs.remove(blog),
              //             isSaved = !isSaved
              //           }
              //         : {
              //             GetIt.I.get<UserData>().savedBlogs.add(blog),
              //             isSaved = !isSaved
              //           };
              //   },
              // ),
              // TopStories(
              //   category: "IOT",
              //   onSaved: (Blog blog) {
              //     isSaved
              //         ? {
              //             GetIt.I.get<UserData>().savedBlogs.remove(blog),
              //             isSaved = !isSaved
              //           }
              //         : {
              //             GetIt.I.get<UserData>().savedBlogs.add(blog),
              //             isSaved = !isSaved
              //           };
              //   },
              // ),
    