import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_feed_app/screens/edit_post.dart';
import 'package:news_feed_app/widgets/post.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white), 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(0, 33, 149, 243),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/svg/language.svg'), 
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.white),
            onPressed: () {},
          ),
           IconButton(
            icon: const Icon(Icons.create_outlined , color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditPost()));
            },
          ),
        ],
      ),
      body: const Post()
    );
  }
}

