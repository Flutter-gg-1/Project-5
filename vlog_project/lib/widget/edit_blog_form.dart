import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vlog_project/model/blog_model.dart';

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
    // Dispose controllers when done
    _titleController.dispose();
    _summaryController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveEdits() {
    if (_formKey.currentState!.validate()) {
      // Create an updated blog object
      final updatedBlog = widget.blog.copyWith(
        title: _titleController.text,
        summary: _summaryController.text,
        content: _contentController.text,
      );

      // Retrieve the existing blogs from storage
      List<Blog> blogs = box.read('blogs') != null
          ? (box.read('blogs') as List).map((e) => Blog.fromJson(e)).toList()
          : [];

      // Find the index of the current blog in the list and update it
      final index = blogs.indexWhere((b) => b.id == updatedBlog.id);
      if (index != -1) {
        blogs[index] = updatedBlog;
        box.write('blogs', blogs.map((e) => e.toJson()).toList());
      }

      // Return to the previous screen and indicate that an update was made
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
                buildTextField(
                  controller: _titleController,
                  hintText: "Edit your blog title",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                buildTextField(
                  controller: _summaryController,
                  hintText: "Edit your blog summary",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a summary';
                    }
                    return null;
                  },
                ),
                buildTextField(
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

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    int minLines = 1,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xff393939),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        style: const TextStyle(color: Colors.white),
        validator: validator,
      ),
    );
  }
}
