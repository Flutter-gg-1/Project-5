import 'package:blog_app/services/setup.dart';
import 'package:blog_app/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/blog_data.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../styles/colours.dart';
import '../widgets/custom_text_field.dart';
import 'news_screen.dart';

class EditPostScreen extends StatefulWidget {
  final Post post;
  final User user;
  const EditPostScreen({super.key, required this.post, required this.user});

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: widget.post.title);
    TextEditingController summaryController =
        TextEditingController(text: widget.post.summary);
    TextEditingController contentController =
        TextEditingController(text: widget.post.content);
    TextEditingController minutesController =
        TextEditingController(text: '${widget.post.readingMinutes}');
    String? selectedCategory = widget.post.category;
    final key = GlobalKey<FormState>();

    List categories = [
      'TECHNOOLOGY',
      'AI',
      'CLOUD',
      'ROBOTICS',
      'IOT',
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colours.iconPrimary,
        ),
        centerTitle: true,
        actions: [
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colours.chipPrimary),
            onPressed: () {
              if (key.currentState!.validate() && selectedCategory != null) {
                Post editedPost = Post.fromJson({
                  'title': titleController.text,
                  'summary': summaryController.text,
                  'content': contentController.text,
                  'category': selectedCategory,
                  'readingMinutes': int.parse(minutesController.text),
                  'author': widget.post.author,
                  'date_created':
                      DateFormat('MMM d, yyyy').format(DateTime.now()),
                  'image': null
                });
                locator.get<BlogData>().updatePost(widget.post, editedPost);
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text(
                          'Post has been updated',
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
                      builder: (context) => NewsScreen(
                        post: widget.post,
                        user: widget.user,
                      ),
                    ),
                  );
                });
              }
            },
            child: const Text(
              'Save',
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
