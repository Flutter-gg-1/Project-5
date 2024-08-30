import 'package:flutter/material.dart';
import '../core/all_file.dart';

class NewPost extends StatelessWidget {
  const NewPost({super.key});

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
                      onPressed: () {},
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
                const MyPostTextField(
                  hintText: 'Enter Your blog title',
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
                  child: const TextField(
                    decoration: InputDecoration(
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
                      text: 'Content',
                      style: TextStyle(color: MyColors.whiteTextColor)),
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ])),
                SizedBox(height: context.getWidthScreen(width: 0.04)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyButton(text: 'Technology'),
                  ],
                ),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: 'Reading minutes',
                      style: TextStyle(color: MyColors.whiteTextColor)),
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ])),
                const MyPostTextField(
                  hintText: 'Minutes of reading this blog',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
