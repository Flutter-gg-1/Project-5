import 'package:blog_app/data/app_data.dart';
import 'package:blog_app/models/blog.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BlogScreen extends StatefulWidget {
  final Blog? blog;
  const BlogScreen({super.key, required this.blog});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = GetIt.I<AppData>().loggedIn;

    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        actions: [
          const Icon(
            Icons.font_download_outlined,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.bookmark_border,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          if (isLoggedIn)
            const Icon(
              Icons.edit_outlined,
              color: Colors.white,
            )
          else
            const SizedBox(
              width: 10,
            ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.blog!.image,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.blog!.category,
                      style: const TextStyle(color: Color(0xffBDA6F5)),
                    ),
                    Text(
                      widget.blog!.title,
                      style: const TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      widget.blog!.authorName,
                      style: const TextStyle(
                          color: Color(0xffB8B8B8),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.blog!.minToRead} min read • ${widget.blog!.date}",
                      style: const TextStyle(
                          color: Color(0xffB8B8B8),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Color(0xffCFCFCF),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.facebook,
                          color: Color(0xffCFCFCF),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.facebook,
                          color: Color(0xffCFCFCF),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Summary",
                      style: TextStyle(
                        color: Color(0xffCFCFCF),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      widget.blog!.summary,
                      style: const TextStyle(
                        color: Color(0xffB8B8B8),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Content",
                      style: TextStyle(
                        color: Color(0xffCFCFCF),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      widget.blog!.content,
                      style: const TextStyle(
                        color: Color(0xffB8B8B8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
