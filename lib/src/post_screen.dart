import 'dart:io';

import 'package:blog_app/data_layer/blog_data.dart';
import 'package:blog_app/extension/size_config.dart';
import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/widget/bars/category_tabs.dart';
import 'package:blog_app/widget/text/custom_text.dart';
import 'package:blog_app/widget/text/required_text.dart';
import 'package:blog_app/widget/text_feild/custom_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController readingMinController = TextEditingController();
  String categoryType = 'Technology';
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    List<String> category = [
      'Technology',
      'AI',
      'Cloud',
      'Robotic',
      'IoT',
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    summaryController.text.isNotEmpty &&
                    contentController.text.isNotEmpty &&
                    readingMinController.text.isNotEmpty) {
                  GetIt.I.get<BlogData>().blogs.add(BlogModel(
                      category: categoryType,
                      title: titleController.text,
                      writer: 'writer',
                      time: readingMinController.text,
                      summary: summaryController.text,
                      content: contentController.text));
                  Navigator.pop(context, true);
                } else {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                      width: double.infinity,
                      height: context.getHeight() * 0.25,
                      child: const Center(
                          child: Text(
                        "Fill the requierd feild if you want to post",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  );
                }
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
                child: selectedImage == null
                    ? IconButton(
                        onPressed: () {
                          pickImage();
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 65,
                          color: Color(0xff969696),
                        ))
                    : Image.file(selectedImage!)),

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
            CategoryTabs(
              onTap: (p0) {
                categoryType = category[p0];
                setState(() {});
              },
            ),
            //Reading minutes
            const RequiredText(
              text: 'Reading minutes',
            ),
            CustomTextFeild(
              hintText: 'Minutes of reading this blog',
              maxLines: 1,
              controller: readingMinController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
        ),
      )),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }
}
