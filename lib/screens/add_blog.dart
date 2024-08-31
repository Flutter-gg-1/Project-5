import 'package:flutter/material.dart';

class AddBlog extends StatefulWidget {
  final void Function({
    required String title,
    required String summary,
    required String content,
    required String category,
  }) onSaved;

  const AddBlog({super.key, required this.onSaved});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final formKey = GlobalKey<FormState>();
  List<String> categories = ["TECHNOLOGY", "AI", "CLOUD", "ROBOTICS", "IOT"];
  String selectedCategory = "";
  String title = "";
  String summary = "";
  String content = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                widget.onSaved(
                  title: title,
                  summary: summary,
                  content: content,
                  category: selectedCategory
                );
              }
              Navigator.pop(context);
            },
            child: const Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Image",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Handle image picking logic here
                    },
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color(0x1fffffff),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 70,
                          color: Color(0xffB8B8B8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " *",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    maxLines: 2,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      hintText: "Enter blog title",
                      hintStyle: const TextStyle(
                        color: Color(0xffB8B8B8),
                        fontSize: 14,
                      ),
                      fillColor: const Color(0x1FFFFFFF),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Title is required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      title = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Text(
                        "Summary",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " *",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    maxLines: 3,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      hintText: "Enter blog summary",
                      hintStyle: const TextStyle(
                        color: Color(0xffB8B8B8),
                        fontSize: 14,
                      ),
                      fillColor: const Color(0x1FFFFFFF),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Summary is required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      summary = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Text(
                        "Content",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " *",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    maxLines: 12,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                      hintText: "Enter blog content",
                      hintStyle: const TextStyle(
                        color: Color(0xffB8B8B8),
                        fontSize: 14,
                      ),
                      fillColor: const Color(0x1FFFFFFF),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Content is required';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      content = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " *",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories.map((category) {
                        bool isSelected = selectedCategory == category;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xff595959),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                      color: isSelected
                                          ? const Color(0xffA48BE2)
                                          : const Color(0xff2C2C2C)),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
