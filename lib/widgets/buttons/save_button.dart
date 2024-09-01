import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:flutter/material.dart';
class SaveButton extends StatelessWidget {
  final bool isSaved;
  final VoidCallback? onPressed;

  const SaveButton({
    super.key,
    required this.isSaved,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isSaved ? Icons.bookmark : Icons.bookmark_border,
        color: isSaved ? ColorExt.white : ColorExt.greyOpc
      ),
      onPressed: onPressed,
    );
  }
}

