import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:flutter/material.dart';

class AddNews extends StatelessWidget {
  const AddNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExt.background,
      appBar: AppBar(
        backgroundColor: ColorExt.leaden,
        actions: [
          TextButton(onPressed: (){}, child: Text("Post"))
        ],
      ),
    );
  }
}