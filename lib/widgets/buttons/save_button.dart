import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:get_it/get_it.dart';
import 'package:blog_app/data_layer/user_data.dart';



class SaveButton extends StatelessWidget {
  final bool isSaved;
  final VoidCallback? onPressed;

  const SaveButton({
    Key? key,
    required this.isSaved,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isSaved ? Icons.bookmark : Icons.bookmark_border,
        color: Colors.white, 
      ),
      onPressed: onPressed,
    );
  }
}

