import 'package:flutter/material.dart';
import 'package:vlog_project/screens/User_Screens/user_home_screen.dart';

class UserBlogPageWithEdit extends StatefulWidget {
  const UserBlogPageWithEdit({super.key});

  @override
  _UserBlogPageWithEditState createState() => _UserBlogPageWithEditState();
}

class _UserBlogPageWithEditState extends State<UserBlogPageWithEdit> {
  bool isEditing = false;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _summaryController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
        text:
            "Now Google’s Bard AI Chatbot can\ntalk & respond to visual prompts!");
    _summaryController = TextEditingController(
        text:
            "Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.");
    _contentController = TextEditingController(
        text:
            "The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages 'soon.'");
  }

  @override
  void dispose() {
    _titleController.dispose();
    _summaryController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _saveEdits() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isEditing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Blog updated successfully!')),
      );
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
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const UserHomeScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: _toggleEditing,
            icon: const Icon(Icons.edit_outlined, color: Colors.white),
          ),
          Icon(
            Icons.bookmark_border,
            color: Colors.white,
          ),
          Text(
            "Aa",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(width: 10),
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
                Image.asset(
                  "assets/google-big.png",
                  width: double.infinity,
                  height: 340,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Icon(Icons.line_axis_sharp, color: Color(0XffBDA6F5)),
                    SizedBox(width: 8),
                    Text(
                      "Technology",
                      style: TextStyle(
                        color: Color(0XffBDA6F5),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                isEditing
                    ? _buildTextField(
                        controller: _titleController,
                        labelText: "Title",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      )
                    : Text(
                        _titleController.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/profile_page.png"),
                      radius: 24,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kyle Barr",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "2 min read • Jul 13, 2023",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Summary",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                isEditing
                    ? _buildTextField(
                        controller: _summaryController,
                        labelText: "Summary",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a summary';
                          }
                          return null;
                        },
                        maxLines: 5,
                      )
                    : Text(
                        _summaryController.text,
                        style: const TextStyle(color: Colors.grey),
                      ),
                const SizedBox(height: 30),
                const Text(
                  "Content",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                isEditing
                    ? _buildTextField(
                        controller: _contentController,
                        labelText: "Content",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter content';
                          }
                          return null;
                        },
                        maxLines: 10,
                      )
                    : Text(
                        _contentController.text,
                        style: const TextStyle(color: Colors.grey),
                      ),
                const SizedBox(height: 20),
                if (isEditing)
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: _saveEdits,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffBDA6F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        validator: validator,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: const Color(0xff393939),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
