import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(File?) onImagePicked;

  ImagePickerWidget({required this.onImagePicked});

  @override
  ImagePickerWidgetState createState() => ImagePickerWidgetState();
}

class ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? selectedImage;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        widget.onImagePicked(selectedImage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Image',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: selectedImage == null
              ? Center(
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.grey, size: 40),
                    onPressed: pickImage,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    selectedImage!,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
