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
    return Card(
      color: MyColors.containerBlackColor,
      child: ListTile(
        leading: Container(
            width: context.getWidthScreen(width: 0.21),
            height: context.getHeightScreen(height: 0.11),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(imagePath!, fit: BoxFit.cover)),
        title: Text(title!,
            style: const TextStyle(color: MyColors.whiteTextColor)),
        subtitle: Text(topTitle!,
            style: const TextStyle(color: MyColors.greyTextColor)),
        trailing: const Column(
          children: [
            Icon(Icons.more_vert, color: MyColors.whiteTextColor),
            Icon(Icons.bookmark_border, color: MyColors.whiteTextColor),
          ],
        ),
      ),
    );
  }
}
