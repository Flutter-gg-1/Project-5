import 'package:blogs_app/widgets/customTextField.dart';
import 'package:blogs_app/widgets/image_picker_widget.dart';
import 'package:blogs_app/widgets/selectableCategories.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../data/services/blog_service.dart';
import '../helper/locator.dart';
import '../models/blog.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class AddBlogScreen extends StatefulWidget {
  @override
  AddBlogScreenState createState() => AddBlogScreenState();
}

class AddBlogScreenState extends State<AddBlogScreen> {
  final BlogService blogService = locator<BlogService>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController minutesToReadController =
      TextEditingController();
  final GetStorage storage = GetStorage();

  File? selectedImage;
  String selectedCategory = 'TECHNOLOGY';

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      }
    });
  }

  void addBlog() {
    String username = storage.read('username');
    if (selectedImage == null ||
        titleController.text.isEmpty ||
        contentController.text.isEmpty ||
        selectedCategory.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Please fill all required fields and pick an image.')),
      );
      return;
    }
    String formattedDate = DateFormat('MMM d, yyyy').format(DateTime.now());

    Blog newBlog = Blog(
      id: DateTime.now()
          .toString(), 
      category: selectedCategory,
      authorName: username,
      title: titleController.text,
      summary: summaryController.text,
      content: contentController.text,
      date: formattedDate,
      minutesToRead: minutesToReadController.text,
      postImage: selectedImage!.path,
    );

    blogService.addBlog(newBlog);
    Navigator.pop(context, true); 
  }

  void onImagePicked(File? image) {
    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          TextButton(
            onPressed: addBlog,
            child: Text(
              "Post",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ImagePickerWidget(onImagePicked: onImagePicked),
            CustomTextField(
              label: 'Title *',
              controller: titleController,
              hintText: "Enter your blog title",
            ),
            CustomTextField(
              label: 'Summary *',
              controller: summaryController,
              hintText: "Give a brief summary about your blog",
              minLines: 4,
              maxLines: 6,
            ),
            CustomTextField(
              label: 'Content *',
              controller: contentController,
              hintText: "Write your blog here",
              minLines: 8,
              maxLines: 12,
            ),
            SelectableCategories(
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                });
              },
            ),
            CustomTextField(
              label: 'Reading minutes *',
              controller: minutesToReadController,
              hintText: "Minutes of reading this blog",
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
