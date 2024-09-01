import 'package:blogs_app/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import '../data/services/blog_service.dart';
import '../helper/locator.dart';
import '../models/blog.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditBlogScreen extends StatefulWidget {
  final Blog blog;

  EditBlogScreen({required this.blog});

  @override
  EditBlogScreenState createState() => EditBlogScreenState();
}

class EditBlogScreenState extends State<EditBlogScreen> {
  final BlogService blogService = locator<BlogService>();
  late TextEditingController categoryController;
  late TextEditingController authorNameController;
  late TextEditingController titleController;
  late TextEditingController summaryController;
  late TextEditingController contentController;
  late TextEditingController minutesToReadController;
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    categoryController = TextEditingController(text: widget.blog.category);
    authorNameController = TextEditingController(text: widget.blog.authorName);
    titleController = TextEditingController(text: widget.blog.title);
    summaryController = TextEditingController(text: widget.blog.summary);
    contentController = TextEditingController(text: widget.blog.content);
    minutesToReadController =
        TextEditingController(text: widget.blog.minutesToRead.toString());
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      }
    });
  }

  void updateBlog() {
    Blog updatedBlog = Blog(
      id: widget.blog.id,
      category: categoryController.text,
      authorName: authorNameController.text,
      title: titleController.text,
      summary: summaryController.text,
      content: contentController.text,
      date: widget.blog.date,
      minutesToRead: minutesToReadController.text,
      postImage: selectedImage?.path ?? widget.blog.postImage,
    );

    blogService.updateBlog(updatedBlog);
    Navigator.pop(context);
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
            onPressed: updateBlog,
            child: Text(
              "Save",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            //
            CustomTextField(
              label: 'Title',
              controller: titleController,
              hintText: 'Enter blog title',
            ),

            CustomTextField(
              label: 'Summary',
              controller: summaryController,
              hintText: 'Give a brief summary about your blog',
              minLines: 4,
              maxLines: 6,
            ),

            //
            CustomTextField(
              label: 'Content',
              controller: contentController,
              hintText: 'Write your blog here',
              minLines: 8,
              maxLines: 12,
            ),

            CustomTextField(
              label: 'Reading Minutes',
              controller: minutesToReadController,
              hintText: 'Minutes to read this blog',
            ),
          ],
        ),
      ),
    );
  }
}
