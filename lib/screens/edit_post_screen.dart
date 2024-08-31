import 'package:blog_app/widgets/category_card.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
import '../styles/colours.dart';
import '../widgets/custom_text_field.dart';

class EditPostScreen extends StatelessWidget {
  final Post post;
  const EditPostScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: post.title);
    TextEditingController summaryController =
        TextEditingController(text: post.summary);
    TextEditingController contentController =
        TextEditingController(text: post.content);
    TextEditingController minutesController =
        TextEditingController(text: '${post.readingMinutes}');
    String? selectedCategory = post.category;

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
            onPressed: () {},
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
                    return CategoryCard(category: category);
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
    );
  }
}
