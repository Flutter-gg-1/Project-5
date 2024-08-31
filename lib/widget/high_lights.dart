import 'dart:io';

import 'package:blog_app/helper/screen.dart';
import 'package:flutter/material.dart';

class HighLights extends StatelessWidget {
  const HighLights({
    super.key,
    required this.writer,
    required this.date,
    required this.title, this.imageSrc,
  });
  final String writer;
  final String date;
  final String title;
  final String? imageSrc;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          SizedBox(
            width: context.getWidth(),
            height: context.getHight(value: .2),
            child:imageSrc != ""
                      ? Image.file(File(imageSrc!))
                      : const Placeholder(),
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
                      onPressed: () {},
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
