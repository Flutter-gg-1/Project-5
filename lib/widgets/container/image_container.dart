import 'dart:io';

import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.selectedImage});
  final File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorExt.textField,
        image: selectedImage != null
            ? DecorationImage(
                image: FileImage(selectedImage!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: selectedImage == null
          ? Icon(
              Icons.add,
              size: 70,
              color: ColorExt.greyOpc,
            )
          : null,
    );
  }
}
