import 'package:blog_app_project/helper/extensions/screen.dart';
import 'package:blog_app_project/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class UpdateBlogScreen extends StatelessWidget {
  const UpdateBlogScreen(
      {super.key,
      required this.content,
      required this.summary,
      required this.title});
  final String content;
  final String summary;
  final String title;
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
              onPressed: () {},
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
              title: title,
              content: content,
              summary: summary,
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
