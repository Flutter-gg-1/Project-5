import 'package:blog_app/models/blog.dart';
import 'package:flutter/material.dart';

class EditBlog extends StatefulWidget {
  const EditBlog({super.key, required this.blog});
  final Blog blog;

  @override
  State<EditBlog> createState() => _EditBlogState();
}

class _EditBlogState extends State<EditBlog> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController summaryController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with the existing blog data
    titleController = TextEditingController(text: widget.blog.title);
    summaryController = TextEditingController(text: widget.blog.summary);
    contentController = TextEditingController(text: widget.blog.content);
  }

  @override
  void dispose() {
    titleController.dispose();
    summaryController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void saveBlog() {
    if (formKey.currentState!.validate()) {
      setState(() {
        widget.blog.title = titleController.text;
        widget.blog.summary = summaryController.text;
        widget.blog.content = contentController.text;
      });

      Navigator.pop(context);
    }
  }

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
              onPressed: saveBlog,
              child: const Text("Save", style: TextStyle(color: Colors.white)))
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
                    "Title",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    maxLines: 2,
                    controller: titleController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      hintText: "Enter blog title",
                      hintStyle: const TextStyle(
                          color: Color(0xffB8B8B8), fontSize: 14),
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
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Summary",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    maxLines: 3,
                    controller: summaryController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      hintText: "Enter blog summary",
                      hintStyle: const TextStyle(
                          color: Color(0xffB8B8B8), fontSize: 14),
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
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Content",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    maxLines: 12,
                    controller: contentController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      hintText: "Enter blog content",
                      hintStyle: const TextStyle(
                          color: Color(0xffB8B8B8), fontSize: 14),
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
