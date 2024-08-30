import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  String _selectedCategory = 'TECHNOLOGY';

  final List<String> _categories = [
    'TECHNOLOGY',
    'AI',
    'CLOUD',
    'ROBOTIC',
    'IOT',
  ];

  // Controllers for form fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _readingMinutesController =
      TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // All fields are valid
      // Proceed with saving data or navigating
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form successfully saved!')),
      );
      // Perform your saving logic here
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
            onTap: _saveForm,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Post",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          )
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
                buildSectionTitle("Image"),
                buildImagePicker(),
                buildSectionTitle("Title", required: true),
                buildTextField(
                  controller: _titleController,
                  hintText: "Enter your blog title",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                buildSectionTitle("Summary", required: true),
                buildTextField(
                  controller: _summaryController,
                  hintText: "Give a brief summary about your blog",
                  minLines: 2,
                  maxLines: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a summary';
                    }
                    return null;
                  },
                ),
                buildSectionTitle("Content", required: true),
                buildTextField(
                  controller: _contentController,
                  hintText: "Write your blog here",
                  minLines: 4,
                  maxLines: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the content';
                    }
                    return null;
                  },
                ),
                buildSectionTitle("Category", required: true),
                Wrap(
                  spacing: 8.0,
                  children: _categories.map((category) {
                    final isSelected = _selectedCategory == category;
                    return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: isSelected
                            ? const Color(0xffBDA6F5)
                            : const Color(0xff333333),
                        side: BorderSide(
                          color: isSelected
                              ? const Color(0xffBDA6F5)
                              : const Color(0xff666666),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                buildSectionTitle("Reading minutes", required: true),
                buildTextField(
                  controller: _readingMinutesController,
                  hintText: "Minutes of reading this blog",
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the reading minutes';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _saveForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffBDA6F5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 30.0),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 16, color: Colors.white),
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

  Widget buildSectionTitle(String title, {bool required = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          if (required)
            const Text(
              " *",
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
        ],
      ),
    );
  }

  Widget buildImagePicker() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 140,
        width: double.infinity,
        color: const Color(0xff2E2E2E),
        child: _selectedImage == null
            ? const Center(
                child: Icon(
                  Icons.add,
                  size: 70,
                  color: Colors.grey,
                ),
              )
            : Image.file(
                _selectedImage!,
                fit: BoxFit.cover,
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
