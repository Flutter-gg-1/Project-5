import 'dart:io';
import 'dart:math';
import 'package:blog_app/data_layer/blog_data.dart';
import 'package:blog_app/data_layer/user_data.dart';
import 'package:blog_app/widgets/container/image_container.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:blog_app/widgets/cards/add_text_card.dart';
import 'package:blog_app/widgets/text_felid/custom_text_felid.dart';
import 'package:blog_app/screens/add_news/catagory_button.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:intl/intl.dart';

class AddNews extends StatefulWidget {
  const AddNews({super.key});

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  String? selectedCategory;
  File? selectedImage;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController readingMinutesController =
      TextEditingController();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  String _formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMM d, yyyy');
    return formatter.format(dateTime);
  }

  void _postBlog() {
    final title = titleController.text.trim();
    final summary = summaryController.text.trim();
    final content = contentController.text.trim();
    final readingMinutes = readingMinutesController.text.trim();

    if (title.isEmpty ||
        summary.isEmpty ||
        content.isEmpty ||
        selectedCategory == null ||
        readingMinutes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill in all fields and select a category.')),
      );
      return;
    }

    final userData = GetIt.I.get<UserData>();
    final writerName = userData.currentUser?.userName ?? "";

    final newBlog = BlogModel(
      id: Random().nextInt(999),
      title: title,
      summary: summary,
      content: content,
      category: selectedCategory!,
      readingMinutes: readingMinutes,
      image: selectedImage?.path ?? 'assets/G.png',
      date: _formatDate(DateTime.now()),
      writer: writerName,
    );
    final blogDataInstance = BlogData();
    blogDataInstance.addNewNews(news: newBlog);
    if (userData.currentUser != null) {
      userData.saveBlogToUserNews(newBlog);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Blog post added successfully.')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExt.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ColorExt.white,
            size: 20,
          ),
        ),
        backgroundColor: ColorExt.leaden,
        actions: [
          TextButton(
            onPressed: _postBlog,
            child: Text(
              "Post",
              style: GoogleFonts.inter(
                fontSize: 17,
                color: ColorExt.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Image",
              style: GoogleFonts.inter(
                fontSize: 17,
                color: ColorExt.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: _pickImage,
              child: ImageContainer(selectedImage: selectedImage),
            ),
            const SizedBox(height: 16),
            const AddTextCard(name: "Title"),
            CustomTextFelid(
              controller: titleController,
              hint: "Enter your blog title",
            ),
            const AddTextCard(name: "Summary"),
            CustomTextFelid(
              controller: summaryController,
              hint: "Give a brief summary about your blog",
              minLins: 3,
            ),
            const AddTextCard(name: "Content"),
            CustomTextFelid(
              controller: contentController,
              hint: "Write your blog here",
              minLins: 10,
            ),
            const AddTextCard(name: "Category"),
            SizedBox(
              height: 36,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryButton(
                      category: "Technology",
                      isSelected: selectedCategory == "Technology",
                      onSelectionChanged: (isSelected) {
                        setState(() {
                          selectedCategory = isSelected ? "Technology" : null;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    CategoryButton(
                      category: "AI",
                      isSelected: selectedCategory == "AI",
                      onSelectionChanged: (isSelected) {
                        setState(() {
                          selectedCategory = isSelected ? "AI" : null;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    CategoryButton(
                      category: "Cloud",
                      isSelected: selectedCategory == "Cloud",
                      onSelectionChanged: (isSelected) {
                        setState(() {
                          selectedCategory = isSelected ? "Cloud" : null;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    CategoryButton(
                      category: "Robotics",
                      isSelected: selectedCategory == "Robotics",
                      onSelectionChanged: (isSelected) {
                        setState(() {
                          selectedCategory = isSelected ? "Robotics" : null;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    CategoryButton(
                      category: "IoT",
                      isSelected: selectedCategory == "IoT",
                      onSelectionChanged: (isSelected) {
                        setState(() {
                          selectedCategory = isSelected ? "IoT" : null;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const AddTextCard(name: "Reading minutes"),
            CustomTextFelid(
              controller: readingMinutesController,
              hint: "Minutes of reading this blog",
              minLins: 1,
            ),
          ],
        ),
      ),
    );
  }
}
