import 'dart:convert';
import 'dart:io';
import 'package:blog_app/data/blog_data.dart';
import 'package:blog_app/screens/news_screen.dart';
import 'package:blog_app/services/extensions/screen.dart';
import 'package:blog_app/services/setup.dart';
import 'package:blog_app/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../styles/colours.dart';
import '../widgets/custom_text_field.dart';

class AddPostScreen extends StatefulWidget {
  final User user;
  const AddPostScreen({super.key, required this.user});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController minutesController = TextEditingController();
  String? selectedCategory;
  final key = GlobalKey<FormState>();
  File? selectedImage;
  String? imageAsBase64;

  List categories = [
    'TECHNOOLOGY',
    'AI',
    'CLOUD',
    'ROBOTICS',
    'IOT',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colours.iconPrimary,
        ),
        centerTitle: true,
        title: const Text(
          'Post',
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colours.textPrimary),
        ),
        actions: [
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colours.chipPrimary),
            onPressed: () async {
              if (key.currentState!.validate() && selectedCategory != null) {
                Post newPost = Post.fromJson({
                  'title': titleController.text,
                  'summary': summaryController.text,
                  'content': contentController.text,
                  'category': selectedCategory,
                  'readingMinutes': int.parse(minutesController.text),
                  'author': widget.user.username,
                  'date_created':
                      DateFormat('MMM d, yyyy').format(DateTime.now()),
                  'image': selectedImage != null ? imageAsBase64 : null
                });
                await locator.get<BlogData>().addPost(newPost, widget.user);
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text(
                          'Post has been created',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'))
                        ],
                      );
                    }).then((value) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewsScreen(post: newPost, user: widget.user)));
                });
              } else {
                showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                          content: Text(
                            'Complete All Fields',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ));
              }
            },
            child: const Text(
              'Post',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colours.textPrimary),
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 23, left: 17, right: 17, bottom: 50),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 7),
                  child: Text(
                    'Image',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colours.textPrimary),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      setState(() async {
                        selectedImage = File(image.path);
                        final imageToBase64 = await image.readAsBytes();
                        imageAsBase64 = base64Encode(imageToBase64);
                      });
                    }
                  },
                  child: Center(
                    child: Container(
                        height: context.getHeight() / 5.8,
                        width: context.getWidth() / 1.113,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colours.chipPrimary,
                        ),
                        child: selectedImage == null
                            ? Image.asset('assets/images/add.png')
                            : Image.file(selectedImage!)),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Title',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colours.textPrimary),
                ),
                CustomTextField(
                  controller: titleController,
                  hint: 'Enter your blog title',
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Summary',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colours.textPrimary),
                ),
                CustomTextField(
                  controller: summaryController,
                  hint: 'Give a brief summary about your blog',
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Content',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colours.textPrimary),
                ),
                CustomTextField(
                  controller: contentController,
                  hint: 'write your blog here',
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Category',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colours.textPrimary),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(categories.length, (index) {
                      final String category = categories[index];
                      return CategoryCard(
                        category: category,
                        isSelected: selectedCategory == category,
                        onTap: () {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                      );
                    }),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Reading Minutes',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colours.textPrimary),
                ),
                CustomTextField(
                  controller: minutesController,
                  hint: 'Minutes of reading this blog',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
