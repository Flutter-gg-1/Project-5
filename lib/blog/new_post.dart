import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5/servers/storge/storge.dart';
import '../core/all_file.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  File? imageSelected;
  TextEditingController titleController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController readingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,
                size: 20, color: MyColors.whiteTextColor)),
        backgroundColor: MyColors.primaryColor,
        actions: const [
          Text(
            'Post',
            style: TextStyle(color: MyColors.whiteTextColor),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          color: MyColors.primaryColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Image',
                    style: TextStyle(color: MyColors.whiteTextColor)),
                SizedBox(height: context.getHeightScreen(height: 0.01)),
                MyContainer(
                  height: context.getWidthScreen(width: 0.4),
                  width: context.getWidthScreen(width: 0.9),
                  child: IconButton(
                      onPressed: () async {
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        setState(() {
                          imageSelected = File(image!.path);
                        });
                        print(imageSelected);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 70,
                      )),
                ),
                SizedBox(height: context.getWidthScreen(width: 0.1)),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: 'Title',
                      style: TextStyle(color: MyColors.whiteTextColor)),
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ])),
                MyPostTextField(
                  controller: titleController,
                  hintText: 'Enter Your blog title',
                ),
                SizedBox(height: context.getWidthScreen(width: 0.1)),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: 'Summary',
                      style: TextStyle(color: MyColors.whiteTextColor)),
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ])),
                SizedBox(height: context.getWidthScreen(width: 0.02)),
                MyContainer(
                  height: context.getWidthScreen(width: 0.3),
                  width: context.getWidthScreen(width: 0.9),
                  child: TextField(
                    controller: summaryController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Give a short summary of your blog',
                      hintStyle: TextStyle(color: MyColors.greyTextColor),
                    ),
                  ),
                ),
                SizedBox(height: context.getWidthScreen(width: 0.1)),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: 'Content',
                      style: TextStyle(color: MyColors.whiteTextColor)),
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ])),
                SizedBox(height: context.getWidthScreen(width: 0.02)),
                MyContainer(
                  height: context.getWidthScreen(width: 0.5),
                  width: context.getWidthScreen(width: 0.9),
                  child: TextField(
                    controller: contentController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Your blog content',
                      hintStyle: TextStyle(color: MyColors.greyTextColor),
                    ),
                  ),
                ),
                SizedBox(height: context.getWidthScreen(width: 0.04)),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: 'Category',
                      style: TextStyle(color: MyColors.whiteTextColor)),
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ])),
                SizedBox(height: context.getWidthScreen(width: 0.04)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyButton(text: 'Technology', onPressed: () {}),
                      SizedBox(width: context.getWidthScreen(width: 0.02)),
                      MyButton2(text: 'AI', onPressed: () {}),
                      SizedBox(width: context.getWidthScreen(width: 0.02)),
                      MyButton2(text: 'CLOUD', onPressed: () {}),
                      SizedBox(width: context.getWidthScreen(width: 0.02)),
                      MyButton2(text: 'ROBOTIC', onPressed: () {}),
                      SizedBox(width: context.getWidthScreen(width: 0.02)),
                      MyButton2(text: 'IOT', onPressed: () {}),
                    ],
                  ),
                ),
                SizedBox(height: context.getWidthScreen(width: 0.05)),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: 'Reading minutes',
                      style: TextStyle(color: MyColors.whiteTextColor)),
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ])),
                MyPostTextField(
                  controller: readingController,
                  hintText: 'Minutes of reading this blog',
                ),
                SizedBox(height: context.getWidthScreen(width: 0.07)),
                Align(
                    child: MyButton(
                        text: 'Post',
                        onPressed: () {
                          box.write('title', titleController.text);
                          box.write('summary', summaryController.text);
                          box.write('content', contentController.text);
                          box.write('reading', readingController.text);
                          context.showScreen(const ShowPost());
                        })),
                SizedBox(height: context.getWidthScreen(width: 0.07)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
