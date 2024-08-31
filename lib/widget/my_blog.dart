import 'dart:io';

import 'package:blog_app/helper/screen.dart';
import 'package:flutter/material.dart';

class MyBlog extends StatelessWidget {
  const MyBlog({
    super.key,
    required this.writer,
    required this.title,
    required this.date,
    required this.min,
    this.delete,
    this.edit,
    this.imageSrc,
  });
  final String writer;
  final String title;
  final String date;
  final String min;
  final String? imageSrc;

  final void Function()? delete;
  final void Function()? edit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                height: context.getHight(value: .1),
                width: context.getWidth(value: .2),
                child: imageSrc != ""
                    ? Image.file(File(imageSrc!))
                    : const Placeholder(),
              ),
              title: Text(
                  style: const TextStyle(color: Color(0xffB8B8B8)), writer),
              subtitle: Text(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  title),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    style: const TextStyle(color: Color(0xffB8B8B8)),
                    "$date . $min mints to read"),
                Row(
                  children: [
                    IconButton(
                        onPressed: delete,
                        icon: const Icon(color: Colors.red, Icons.delete)),
                    IconButton(onPressed: edit, icon: const Icon(Icons.edit)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
