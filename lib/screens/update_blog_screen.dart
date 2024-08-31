import 'package:blog_app_project/data/blog_data.dart';
import 'package:blog_app_project/helper/extensions/screen.dart';
import 'package:blog_app_project/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UpdateBlogScreen extends StatefulWidget {
  const UpdateBlogScreen(
      {super.key,
      required this.content,
      required this.summary,
      required this.title,
      required this.id});
  final String content;
  final String summary;
  final String title;
  final int id;

  @override
  State<UpdateBlogScreen> createState() => _UpdateBlogScreenState();
}

class _UpdateBlogScreenState extends State<UpdateBlogScreen> {
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
          TextButton(
              onPressed: () {
                final blogData = GetIt.I<BlogData>();
                final blogIndex = blogData.blogList
                    .indexWhere((blog) => blog.id == widget.id);
                if (blogIndex != -1) {
                  blogData.blogList[blogIndex].title = widget.title;
                  blogData.blogList[blogIndex].summary = widget.summary;
                  blogData.blogList[blogIndex].content = widget.content;
                }
                Navigator.pop(context);
                setState(() {});
              },
              child: const Text(
                'Post',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            CustomeUpdateBlog(
              title: widget.title,
              content: widget.content,
              summary: widget.summary,
            )
          ]),
        ),
      ),
    );
  }
}

class CustomeUpdateBlog extends StatelessWidget {
  const CustomeUpdateBlog({
    super.key,
    required this.content,
    required this.summary,
    required this.title,
  });
  final String content;
  final String summary;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.getHeight() / 19,
        ),
        SizedBox(
          height: context.getHeight() / 74,
        ),
        const Row(
          children: [
            Text(
              'Title',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  fontFamily: 'Inter'),
            ),
          ],
        ),
        SizedBox(
          height: context.getHeight() / 74,
        ),
        CustomTextFormFelid(
          minLines: 2,
          content: title,
        ),
        SizedBox(
          height: context.getHeight() / 30,
        ),
        const Row(
          children: [
            Text(
              'Summary',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  fontFamily: 'Inter'),
            ),
          ],
        ),
        SizedBox(
          height: context.getHeight() / 74,
        ),
        CustomTextFormFelid(
          minLines: 4,
          content: summary,
        ),
        SizedBox(
          height: context.getHeight() / 30,
        ),
        const Row(
          children: [
            Text(
              'Content',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  fontFamily: 'Inter'),
            ),
          ],
        ),
        SizedBox(
          height: context.getHeight() / 74,
        ),
        CustomTextFormFelid(minLines: 18, content: content),
      ],
    );
  }
}
