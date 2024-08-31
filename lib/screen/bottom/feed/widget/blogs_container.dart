import 'package:flutter/material.dart';
import 'package:project_5/core/all_file.dart';

class MyContainerBlogs extends StatelessWidget {
  const MyContainerBlogs(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.topTitle});

  final String? title;
  final String? topTitle;
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      width: context.getWidthScreen(width: 0.9),
      height: context.getWidthScreen(width: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.getHeightScreen(height: 0.02)),
          Row(
            children: [
              Image.asset(imagePath!, width: 150),
              Column(
                children: [
                  Text(topTitle!,
                      style: const TextStyle(color: MyColors.greyTextColor)),
                  Text(title!,
                      style: const TextStyle(color: MyColors.whiteTextColor)),
                ],
              ),
            ],
          ),
          const Row(
            children: [
              Text('1h', style: TextStyle(color: MyColors.whiteTextColor)),
              Icon(Icons.more_vert, color: MyColors.whiteTextColor),
              Icon(Icons.bookmark_border, color: MyColors.whiteTextColor),
            ],
          ),
        ],
      ),
    );
  }
}
/*
Text(title!,
            style: const TextStyle(color: MyColors.whiteTextColor)),
         
         const Column(
          children: [
          ],
        ),
*/