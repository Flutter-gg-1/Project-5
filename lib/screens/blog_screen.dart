import 'package:blog_app_project/data/blog_data.dart';
import 'package:blog_app_project/helper/extensions/screen.dart';
import 'package:blog_app_project/screens/update_blog_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen(
      {super.key,
      required this.content,
      required this.summary,
      required this.nameOfBlog,
      required this.title,
      required this.dateblog,
      required this.time,
      this.imageSrc,
      required this.category});

  final String content;
  final String summary;
  final String title;
  final String nameOfBlog;
  final String dateblog;
  final String time;
  final String? imageSrc;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.font,
              color: Color(0xff888888),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.bookmark,
              color: Color(0xff888888),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              GetIt.I
                  .get<BlogData>()
                  .blogList
                  .map((e) => Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return UpdateBlogScreen(
                          content: e.content,
                          summary: e.summary,
                          title: e.title,
                        );
                      })))
                  .toList();
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (BuildContext context) {
              //   return const UpdateBlogScreen(content: ,);
              // }));
            },
            icon: const FaIcon(
              FontAwesomeIcons.pencil,
              color: Color(0xff888888),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            CustomeDisplayBlog(
              title: title,
              dateblog: dateblog,
              nameOfBlog: nameOfBlog,
              time: time.toString(),
              content: content,
              category: category,
              summary: summary,
            )
          ]),
        ),
      ),
    );
  }
}

class CustomeDisplayBlog extends StatelessWidget {
  const CustomeDisplayBlog(
      {super.key,
      required this.nameOfBlog,
      required this.title,
      required this.dateblog,
      this.imageSrc,
      required this.time,
      required this.category,
      required this.content,
      required this.summary});

  final String content;
  final String summary;
  final String nameOfBlog;
  final String title;
  final String dateblog;
  final String time;
  final String? imageSrc;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: context.getWidth(),
          child: Image.asset(
            'assets/Image.png',
            width: context.getWidth(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.account_box,
                    color: Color(0xffBDA6F5),
                  ),
                  Text(
                    category,
                    style: const TextStyle(
                        color: Color(0xffBDA6F5),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: 'Inter'),
                  )
                ],
              ),
              Container(
                constraints: BoxConstraints(maxWidth: context.getWidth()),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            fontFamily: 'Inter'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircleAvatar(
                    child: Image.asset('assets/Vector(2).png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    nameOfBlog,
                    style: const TextStyle(
                        color: Color(0xffB8B8B8),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: 'Inter'),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    '$time min read • $dateblog',
                    style: const TextStyle(
                        color: Color(0xff888888),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: 'Inter'),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.facebookF,
                    color: Color(0xff888888),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FaIcon(
                    FontAwesomeIcons.twitter,
                    color: Color(0xff888888),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FaIcon(
                    FontAwesomeIcons.link,
                    color: Color(0xff888888),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
                children: [
                  Text(
                    'Summary',
                    style: TextStyle(
                        color: Color(0xffE8E8E8),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'Inter'),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      summary,
                      style: const TextStyle(
                          color: Color(0xff888888),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: 'Inter'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              const Row(
                children: [
                  Text(
                    'Content',
                    style: TextStyle(
                        color: Color(0xffE8E8E8),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'Inter'),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      content,
                      style: const TextStyle(
                          color: Color(0xff888888),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: 'Inter'),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
