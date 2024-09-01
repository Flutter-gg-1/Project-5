import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_5/components/text/text_custom.dart';
import 'package:project_5/components/textfield/custom_text_field.dart';
import 'package:project_5/data_layer/blog_data.dart';
import 'package:project_5/models/blog_model.dart';
import 'package:project_5/services/setup.dart';
import 'package:intl/intl.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerSummary = TextEditingController();
  TextEditingController controllerContent = TextEditingController();
  TextEditingController controllerReadtime = TextEditingController();

  final List<String> categoriesList = [
    'TECHNOLOGY',
    'AI',
    'CLOUD',
    'ROBOTIC',
    'IOT'
  ];
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        actions: [
          TextButton(
              onPressed: () {
                final now = DateTime.now();
                final DateFormat formatter = DateFormat('MMM dd, yyyy');
                final String formatted = formatter.format(now).toString();
                getIt.get<BlogData>().addNewBlog(
                    newBlog: BlogModel(
                        id: Random().nextInt(999999),
                        isFavorite: false,
                        category: selectedItem!,
                        authorName: "Kyle Barr",
                        title: controllerTitle.text,
                        summary: controllerSummary.text,
                        content: controllerContent.text,
                        date: formatted,
                        minutesToRead: controllerReadtime.text));
                Navigator.pop(context, true);
              },
              child: const TextCustom(
                  text: "Post",
                  color: Colors.white,
                  weight: FontWeight.w700,
                  fontSize: 17))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextCustom(
                  text: "Image",
                  color: Colors.white,
                  weight: FontWeight.w700,
                  fontSize: 17),
              const SizedBox(
                height: 7,
              ),
              Container(
                width: 337,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff2e2e2e)),
                child: const Center(
                  child: Icon(
                    Icons.add_rounded,
                    size: 62,
                    color: Color(0xff969696),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Badge(
                  offset: Offset(12, 2),
                  backgroundColor: Colors.transparent,
                  label: Text(
                    "*",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  child: TextCustom(
                      text: "Title",
                      color: Colors.white,
                      weight: FontWeight.w700,
                      fontSize: 17)),
              const SizedBox(
                height: 7,
              ),
              CustomTextField(
                  hintText: "Enter your blog title",
                  controller: controllerTitle,
                  minlines: 1),
              const SizedBox(
                height: 32,
              ),
              const Badge(
                  offset: Offset(12, 2),
                  backgroundColor: Colors.transparent,
                  label: Text(
                    "*",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  child: TextCustom(
                      text: "Summary",
                      color: Colors.white,
                      weight: FontWeight.w700,
                      fontSize: 17)),
              const SizedBox(
                height: 7,
              ),
              CustomTextField(
                  hintText: "Give a brief summary about your blog ",
                  controller: controllerSummary,
                  minlines: 2),
              const SizedBox(
                height: 32,
              ),
              const Badge(
                  offset: Offset(12, 2),
                  backgroundColor: Colors.transparent,
                  label: Text(
                    "*",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  child: TextCustom(
                      text: "Content",
                      color: Colors.white,
                      weight: FontWeight.w700,
                      fontSize: 17)),
              const SizedBox(
                height: 7,
              ),
              CustomTextField(
                  hintText: "write your blog here",
                  controller: controllerContent,
                  minlines: 6),
              const SizedBox(
                height: 32,
              ),
              const Badge(
                  offset: Offset(12, 2),
                  backgroundColor: Colors.transparent,
                  label: Text(
                    "*",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  child: TextCustom(
                      text: "Category",
                      color: Colors.white,
                      weight: FontWeight.w700,
                      fontSize: 17)),
              const SizedBox(
                height: 7,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Wrap(
                      spacing: 8,
                      children: categoriesList
                          .map((item) => ChoiceChip(
                              showCheckmark: false,
                              backgroundColor: const Color(0xFF595959),
                              selectedColor: Colors.white,
                              onSelected: (bool selected) {
                                selectedItem = selected ? item : null;
                                setState(() {});
                              },
                              label: Text(
                                item,
                                style: TextStyle(
                                  color: selectedItem == item
                                      ? const Color(0xFFA48BE2)
                                      : const Color(0xFF2C2C2C),
                                ),
                              ),
                              selected: selectedItem == item))
                          .toList(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Badge(
                  offset: Offset(12, 2),
                  backgroundColor: Colors.transparent,
                  label: Text(
                    "*",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  child: TextCustom(
                      text: "Reading minutes",
                      color: Colors.white,
                      weight: FontWeight.w700,
                      fontSize: 17)),
              const SizedBox(
                height: 7,
              ),
              CustomTextField(
                  hintText: "Minutes of reading this blog",
                  controller: controllerReadtime,
                  minlines: 1)
            ],
          ),
        ),
      )),
    );
  }
}
