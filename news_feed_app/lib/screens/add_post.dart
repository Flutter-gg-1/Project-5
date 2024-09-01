import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_feed_app/post_data.dart';
import 'package:news_feed_app/post_data_model.dart';
import 'package:news_feed_app/widgets/category_list.dart';
import 'package:news_feed_app/widgets/custom_textfeild.dart';
import 'package:news_feed_app/widgets/image_picker.dart';
import 'package:intl/intl.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();
  
  String? categorySelected;
  File? selectedImage;


String getCurrentDate() {
  return DateFormat('MMM dd, yyyy').format(DateTime.now());
}

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
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(const Color(0xff111111)),
            ),
            onPressed: () {
              if (categorySelected != null &&
                  titleController.text.isNotEmpty &&
                  summaryController.text.isNotEmpty &&
                  contentController.text.isNotEmpty &&
                  minuteController.text.isNotEmpty) {
                PostDataModel newPost = PostDataModel(
                  id: Random().nextInt(999),
                  category: categorySelected!,
                  author: 'user',
                  title: titleController.text,
                  summary: summaryController.text,
                  content: contentController.text,
                  date: getCurrentDate(),
                  minutes: minuteController.text, // Parse minutes
                  image: selectedImage?.path ?? 'assets/images/placehholder.png', 
                );
                GetIt.I.get<PostData>().addNewPost(newPost: newPost);
                
                    // Show a confirmation message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Post added successfully!')),
                );
                Navigator.pop(context, true);
              }
            },
            child: const Text(
              'Post',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              const Text('Image', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xffffffff))),
              const SizedBox(height: 10),
              ImagePickerWidget(
                onImageSelected: (File image) {
                  setState(() {
                    selectedImage = image;
                  });
                },
                selectedImage: selectedImage,
              ),
              const SizedBox(height: 30),
              TextContainer(
                title: 'Title',
                hint: 'Enter your blog title',
                titleSize: 16,
                titleWeight: FontWeight.w700,
                unlimittedLines: true,
                textController: titleController,
              ),
              const SizedBox(height: 30),
              TextContainer(
                title: 'Summary',
                hint: 'Give a brief summary about your blog',
                titleSize: 16,
                titleWeight: FontWeight.w700,
                unlimittedLines: true,
                feildlines: 2,
                textController: summaryController,
              ),
              const SizedBox(height: 30),
              TextContainer(
                title: 'Content',
                hint: 'Write your blog here',
                titleSize: 16,
                titleWeight: FontWeight.w700,
                unlimittedLines: true,
                feildlines: 5,
                textController: contentController,
              ),
              const SizedBox(height: 30),
              const Text('Category', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xffffffff))),
              const SizedBox(height: 10),
              CategoryList(
                selectedValue: categorySelected,
                onCategorySelected: (String value) {
                  setState(() {
                    categorySelected = value; // Update the selected category
                  });
                },
              ),
              const SizedBox(height: 30),
              TextContainer(
                title: 'Reading minutes',
                hint: 'Minutes of reading this blog',
                titleSize: 16,
                titleWeight: FontWeight.w700,
                unlimittedLines: true,
                textController: minuteController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

