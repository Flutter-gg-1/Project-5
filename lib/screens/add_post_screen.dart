import 'package:blog_app/services/extensions/screen.dart';
import 'package:blog_app/widgets/category_card.dart';
import 'package:flutter/material.dart';
import '../styles/colours.dart';
import '../widgets/custom_text_field.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController summaryController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    TextEditingController minutesController = TextEditingController();
    String? selectedCategory;

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
        title: const Text(
          'Post',
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colours.textPrimary),
        ),
        actions:  [
         ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colours.chipPrimary),
          onPressed: (){
          }, child: const Text(
          'Post',
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colours.textPrimary),
        ),),
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
              Center(
                child: Container(
                    height: context.getHeight() / 5.8,
                    width: context.getWidth() / 1.113,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colours.chipPrimary,
                    ),
                    child: Image.asset('assets/images/add.png')),
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
