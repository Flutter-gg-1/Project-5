import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_5/components/text/text_custom.dart';
import 'package:project_5/components/textfield/custom_text_field.dart';
import 'package:project_5/data_layer/blog_data.dart';
import 'package:project_5/services/setup.dart';

class EditBlogScreen extends StatefulWidget {
  final int selectedId;
  const EditBlogScreen({super.key, required this.selectedId});

  @override
  State<EditBlogScreen> createState() => _EditBlogScreenState();
}

class _EditBlogScreenState extends State<EditBlogScreen> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerSummary = TextEditingController();
  TextEditingController controllerContent = TextEditingController();
  TextEditingController controllerReadtime = TextEditingController();
  @override
  void initState() {
    super.initState();
    var selectedBlog = getIt
        .get<BlogData>()
        .blogs
        .firstWhere((e) => e.id == widget.selectedId);
    selectedItem = selectedBlog.category;
    controllerTitle.text = selectedBlog.title;
    controllerSummary.text = selectedBlog.summary;
    controllerContent.text = selectedBlog.content;
    controllerReadtime.text = selectedBlog.minutesToRead;
  }

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
    var selectedBlog = getIt
        .get<BlogData>()
        .blogs
        .firstWhere((e) => e.id == widget.selectedId);

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
                selectedBlog.category = selectedItem!;
                selectedBlog.content = controllerContent.text;
                selectedBlog.summary = controllerSummary.text;
                selectedBlog.minutesToRead = controllerReadtime.text;
                selectedBlog.title = controllerTitle.text;
                selectedBlog.date = formatted;
                setState(() {});

                Navigator.pop(context, true);
              },
              child: const TextCustom(
                  text: "Save",
                  color: Colors.white,
                  weight: FontWeight.w700,
                  fontSize: 17))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextCustom(
                  text: "Title",
                  color: Colors.white,
                  weight: FontWeight.w700,
                  fontSize: 17),
              const SizedBox(
                height: 7,
              ),
              CustomTextField(
                  hintText: "Enter your blog title",
                  controller: controllerTitle,
                  minlines: 2),
              const SizedBox(
                height: 32,
              ),
              const TextCustom(
                  text: "Summary",
                  color: Colors.white,
                  weight: FontWeight.w700,
                  fontSize: 17),
              const SizedBox(
                height: 7,
              ),
              CustomTextField(
                  hintText: "Give a brief summary about your blog ",
                  controller: controllerSummary,
                  minlines: 3),
              const SizedBox(
                height: 32,
              ),
              const TextCustom(
                  text: "Content",
                  color: Colors.white,
                  weight: FontWeight.w700,
                  fontSize: 17),
              const SizedBox(
                height: 7,
              ),
              CustomTextField(
                  hintText: "write your blog here ",
                  controller: controllerContent,
                  minlines: 10),
              const SizedBox(
                height: 32,
              ),
              const TextCustom(
                  text: "Category",
                  color: Colors.white,
                  weight: FontWeight.w700,
                  fontSize: 17),
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
              const TextCustom(
                  text: "Reading minutes ",
                  color: Colors.white,
                  weight: FontWeight.w700,
                  fontSize: 17),
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
