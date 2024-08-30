import 'package:blog_app/widget/text/custom_text.dart';
import 'package:blog_app/widget/text/required_text.dart';
import 'package:blog_app/widget/text_feild/custom_feild.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController summaryController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    TextEditingController readingMinController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const CustomText(text: 'Post')),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(text: 'Image'),
            Container(
              margin: const EdgeInsets.only(top: 7, bottom: 32),
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff2e2e2e)),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 65,
                    color: Color(0xff969696),
                  )),
            ),
            //title
            const RequiredText(
              text: 'Title',
            ),
            CustomTextFeild(
              hintText: 'Enter your blog title',
              maxLines: 1,
              controller: titleController,
            ),
            //summary
            const RequiredText(
              text: 'Summary',
            ),
            CustomTextFeild(
              hintText: 'Give a brief summary about your blog ',
              maxLines: 2,
              controller: summaryController,
            ),
            //content
            const RequiredText(
              text: 'Content',
            ),
            CustomTextFeild(
              hintText: 'write your blog here',
              maxLines: 5,
              controller: contentController,
            ),
            //Category
            const RequiredText(
              text: 'Category',
            ),
            
            //Reading minutes
            const RequiredText(
              text: 'Reading minutes',
            ),
            CustomTextFeild(
              hintText: 'Minutes of reading this blog',
              maxLines: 1,
              controller: readingMinController,
            ),
          ],
        ),
      )),
    );
  }
}
