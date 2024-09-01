import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:news_feed_app/post_data.dart';
import 'package:news_feed_app/screens/edit_post.dart';
import 'package:news_feed_app/widgets/post.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key, required this.postId});

  final int postId;

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    final postData = GetIt.I.get<PostData>().postsList.firstWhere((post) => post.id == widget.postId);
    
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
            icon: const Icon(Icons.create_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditPost(postId: widget.postId)),
              ).then((value) {
                if (value == true) {
                  setState(() {}); // Refresh the page after editing
                }
              });
            },
          ),
        ],
      ),
      body: Post(
        category: postData.category,
        title: postData.title,
        username: postData.author,
        imgPath: postData.image,
        dateAndTime: postData.date,
        minutes: postData.minutes,
        summary: postData.summary,
        content: postData.content,
      ),
    );
  }
}