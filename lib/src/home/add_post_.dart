import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5/src/data_layer/post_data.dart';
import 'package:project_5/src/data_layer/user_data.dart';
import 'package:project_5/src/models/post_models.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  File? image;

  // Controllers for each TextFormField
  final TextEditingController titleController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController readingMinutesController =
      TextEditingController();

  // Define newPost as a class-level variable
  // late PostModel newPost;

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  void savePost() {
    setState(() {});
    var username = GetIt.I.get<UserData>().whoIsLogin();
    PostModel newPost = PostModel(
        title: titleController.text,
        summary: summaryController.text,
        content: contentController.text,
        readingMinutes: readingMinutesController.text,
        // File(img?.path ?? '')
        // image: File(image?.path ?? ''),
        category: '',
        creationDate: DateTime.now(),
        username: username);
   
    GetIt.I.get<PostData>().addNewPost(newPost: newPost);

    Navigator.pop(context);

  }

  @override
  void dispose() {
    // Dispose controllers when not in use
    titleController.dispose();
    summaryController.dispose();
    contentController.dispose();
    readingMinutesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Call savePost function
              savePost();
            },
            child: const Text(
              'Post',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[800],
                  child: image == null
                      ? const Center(
                          child: Icon(Icons.add, color: Colors.white, size: 50))
                      : Image.file(image!, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 6,
              child: ListView(
                children: [
                  // Title

                  buildTextField(
                    controller: titleController,
                    labelText: 'Title',
                    hintText: 'Enter your blog title',
                  ),
                  const SizedBox(height: 20),

                  // Summary

                  buildTextField(
                    controller: summaryController,
                    labelText: 'Summary',
                    hintText: 'Give a brief summary about your blog',
                  ),
                  const SizedBox(height: 20),

                  // Content

                  buildTextField(
                    controller: contentController,
                    labelText: 'Content',
                    hintText: 'Write your blog here',
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),

                  // Category Chips
               
                  const SizedBox(height: 20),

                  // Reading Minutes

                  buildTextField(
                    controller: readingMinutesController,
                    labelText: 'Reading minutes',
                    hintText: 'Minutes of reading this blog',
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.grey[900],
        border: const OutlineInputBorder(),
      ),
      style: const TextStyle(color: Colors.white),
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      label: Text(label),
      labelStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      backgroundColor: color,
    );
  }
}
