
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  final Function(File) onImageSelected;
  final File? selectedImage;

  const ImagePickerWidget({
    super.key,
    required this.onImageSelected,
    this.selectedImage,
  });

  Future<void> pickImage(BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        onImageSelected(File(image.path));
      }
    } catch (error) {
      await Geolocator.openLocationSettings();
    }
  }

  Future<void> determinePosition() async {
    // Implement location permission logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(44, 255, 255, 255),
      ),
      child: InkWell(
        onTap: () => pickImage(context),
        child: selectedImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  selectedImage!,
                  fit: BoxFit.cover,
                ),
              )
            : const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}