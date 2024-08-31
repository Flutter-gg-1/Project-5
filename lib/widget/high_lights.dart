import 'dart:io';

import 'package:blog_app/helper/screen.dart';
import 'package:flutter/material.dart';

class HighLights extends StatelessWidget {
  const HighLights({
    super.key,
    required this.writer,
    required this.date,
    required this.title,
    this.imageSrc = "",
    this.onPressed,
  });
  final String writer;
  final String date;
  final String title;
  final String? imageSrc;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          SizedBox(
            width: context.getWidth(),
            height: context.getHight(value: .2),
            child: imageSrc != ""
                ? Image.file(File(imageSrc!))
                : const Center(
                    child: Text("No image"),
                  ),
          ),
          SizedBox(
            width: context.getWidth(),
            height: context.getHight(value: .2),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(title),
                      subtitle: Text("$writer * $date"),
                    ),
                  ),
                  IconButton(
                      onPressed: onPressed,
                      icon: const Icon(Icons.arrow_outward_sharp))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
