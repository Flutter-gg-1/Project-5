import 'package:blog_app/data_layer/blog_data.dart';
import 'package:blog_app/extension/size_config.dart';
import 'package:blog_app/src/home_screen.dart';
import 'package:blog_app/widget/text/custom_text.dart';
import 'package:blog_app/widget/text_feild/custom_feild.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BlogEditorScreen extends StatefulWidget {
  final String title, summary, content;
  final int id;
  const BlogEditorScreen(
      {super.key,
      required this.title,
      required this.summary,
      required this.content,
      required this.id});

  @override
  State<BlogEditorScreen> createState() => _BlogEditorScreenState();
}

class _BlogEditorScreenState extends State<BlogEditorScreen> {
  String newTitle = '';
  String newSummary = '';
  String newContent = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (newTitle.isNotEmpty &&
                    newSummary.isNotEmpty &&
                    newContent.isNotEmpty) {
                  GetIt.I.get<BlogData>().editBlog(
                      id: widget.id,
                      title: newTitle,
                      summary: newSummary,
                      content: newContent);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                } else if (newTitle.isEmpty ||
                    newSummary.isEmpty ||
                    newContent.isEmpty) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                      width: double.infinity,
                      height: context.getHeight() * 0.25,
                      child: const Center(
                          child: Text(
                        "Error : Make sure you aplly chnges and the feild is not empty",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  );
                }
              },
              child: const CustomText(text: 'Save'))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Title',
              fontSize: 17,
            ),
            CustomTextFeild(
              hintText: '',
              maxLines: 2,
              initialValue: widget.title,
              onChanged: (p0) {
                newTitle = p0;
                setState(() {});
              },
            ),
            const CustomText(
              text: 'Summary',
              fontSize: 17,
            ),
            CustomTextFeild(
              hintText: '',
              maxLines: 3,
              initialValue: widget.summary,
              onChanged: (p0) {
                newSummary = p0;
                setState(() {});
              },
            ),
            const CustomText(
              text: 'Content',
              fontSize: 17,
            ),
            CustomTextFeild(
              hintText: '',
              maxLines: 20,
              initialValue: widget.content,
              onChanged: (p0) {
                newContent = p0;

                setState(() {
                  debugPrint(newContent);
                });
              },
            ),
          ],
        ),
      )),
    );
  }
}
