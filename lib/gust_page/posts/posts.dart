import 'package:flutter/material.dart';
import 'package:project/gust_page/posts/edit_post/add_post.dart';
import 'package:project/gust_page/tech.dart';

class Posts extends StatelessWidget {
  final Tech post;
  final Function(Tech) onUpdate;

  const Posts({super.key, required this.post, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.abc, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_outline, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPost(),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xff111111),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              'lib/gust_page/images/Image.png',
            ),
          ),
        ],
      ),
    );
  }
}
