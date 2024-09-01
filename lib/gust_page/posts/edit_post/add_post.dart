import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:project/User_task/user_task.dart';
import 'package:project/gust_page/posts/edit_post/category.dart';
import 'package:project/gust_page/posts/edit_post/text_field.dart';


class EditPost extends StatefulWidget {
  const EditPost({
    super.key, 
  });

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  late TextEditingController titleController;
  late TextEditingController summaryController;
  late TextEditingController contentController;
  late TextEditingController dateController;
  String? _selectedCategory;
  File? _image;

  final UserTask userTask = GetIt.I<UserTask>();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    summaryController = TextEditingController();
    contentController = TextEditingController();
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    summaryController.dispose();
    contentController.dispose();
    dateController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        title: const Text('Edit Post'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final post = {
                'title': titleController.text,
                'summary': summaryController.text,
                'date': dateController.text,
              };

              userTask.addUserPost(userTask.loadUserData().username, post);

              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _image == null
                    ? const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 50,
                        ),
                      )
                    : Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(height: 16),
            CustomTextFieldWidget(
              controller: titleController,
              labelText: 'Title',
            ),
            const SizedBox(height: 16),
            CustomTextFieldWidget(
              controller: summaryController,
              labelText: 'Summary',
            ),
            const SizedBox(height: 16),
            CustomTextFieldWidget(
              controller: contentController,
              labelText: 'Content',
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            CategorySelectorWidget(
              onCategorySelected: (category) {
                setState(() {
                  _selectedCategory = category;
                });
              },
            ),
            const SizedBox(height: 16),
            CustomTextFieldWidget(
              controller: dateController,
              labelText: 'Date',
            ),
          ],
        ),
      ),
    );
  }
}
