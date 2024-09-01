import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vlog_project/model/blog_model.dart';
import 'package:vlog_project/widget/custom_text_field.dart';

class EditPage extends StatefulWidget {
  final Blog blog;

  const EditPage({Key? key, required this.blog}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _summaryController;
  late TextEditingController _contentController;
  final box = GetStorage();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with the current blog values
    _titleController = TextEditingController(text: widget.blog.title);
    _summaryController = TextEditingController(text: widget.blog.summary);
    _contentController = TextEditingController(text: widget.blog.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _summaryController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveEdits() {
    if (_formKey.currentState!.validate()) {
      // Update the blog with new data
      final updatedBlog = widget.blog.copyWith(
        title: _titleController.text,
        summary: _summaryController.text,
        content: _contentController.text,
      );

      // Retrieve existing blogs from storage
      List<Blog> blogs = box.read('blogs') != null
          ? (box.read('blogs') as List).map((e) => Blog.fromJson(e)).toList()
          : [];

      // Update the blog in the list
      final index = blogs.indexWhere((b) => b.id == updatedBlog.id);
      if (index != -1) {
        blogs[index] = updatedBlog;
        box.write('blogs', blogs.map((e) => e.toJson()).toList());
      }

      // Go back to the previous screen and indicate an update was made
      Navigator.pop(context, true);
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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(
            onTap: _saveEdits,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Edit Blog",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _titleController,
                  hintText: "Edit your blog title",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: _summaryController,
                  hintText: "Edit your blog summary",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a summary';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: _contentController,
                  hintText: "Edit your blog content",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter content';
                    }
                    return null;
                  },
                  minLines: 5,
                  maxLines: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
