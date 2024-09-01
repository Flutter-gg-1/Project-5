import 'dart:io';
import 'package:blog_app/data_layer/blog_data.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:blog_app/widgets/container/image_container.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:blog_app/widgets/text_felid/custom_text_felid.dart';
import 'package:blog_app/screens/add_news/catagory_button.dart';
import 'package:blog_app/widgets/cards/add_text_card.dart';

class EditNewsScreen extends StatefulWidget {
  final BlogModel blog;

  const EditNewsScreen({super.key, required this.blog});

  @override
  State<EditNewsScreen> createState() => _EditNewsScreenState();
}

class _EditNewsScreenState extends State<EditNewsScreen> {
  String? selectedCategory;
  File? selectedImage;

  late TextEditingController _titleController;
  late TextEditingController _summaryController;
  late TextEditingController _contentController;
  late TextEditingController _readingMinutesController;

  late BlogData _blogData;

  @override
  void initState() {
    super.initState();
    _blogData = GetIt.I.get<BlogData>();

    _titleController = TextEditingController(text: widget.blog.title);
    _summaryController = TextEditingController(text: widget.blog.summary);
    _contentController = TextEditingController(text: widget.blog.content);
    _readingMinutesController =
        TextEditingController(text: widget.blog.readingMinutes);
    selectedCategory = widget.blog.category;
    selectedImage = File(widget.blog.image);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _summaryController.dispose();
    _contentController.dispose();
    _readingMinutesController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  void _saveChanges() async {
    final title = _titleController.text.trim();
    final summary = _summaryController.text.trim();
    final content = _contentController.text.trim();
    final readingMinutes = _readingMinutesController.text.trim();

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

    final updatedBlog = BlogModel(
      id:widget.blog.id,
      title: title,
      summary: summary,
      content: content,
      category: selectedCategory!,
      readingMinutes: readingMinutes,
      image: selectedImage?.path ?? 'assets/default.png',
      date: widget.blog.date,
      writer: widget.blog.writer,
    );

    try {
    print('Updating blog with title: $title');
    await _blogData.updateBlog(updatedBlog);
    print('Blog updated');

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Blog updated successfully.')),
      );
      Navigator.pop(context);
    }
  } catch (e) {
    print('Error updating blog: $e');
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update the blog. Please try again.')),
      );
    }
  }
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
            onPressed: _saveChanges,
            child: Text(
              "Save",
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
              controller: _titleController,
              hint: "Enter your blog title",
            ),
            const AddTextCard(name: "Summary"),
            CustomTextFelid(
              controller: _summaryController,
              hint: "Give a brief summary about your blog",
              minLins: 3,
            ),
            const AddTextCard(name: "Content"),
            CustomTextFelid(
              controller: _contentController,
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
              controller: _readingMinutesController,
              hint: "Minutes of reading this blog",
              minLins: 1,
            ),
          ],
        ),
      ),
    );
  }
}
