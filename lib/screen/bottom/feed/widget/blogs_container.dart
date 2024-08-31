import 'package:flutter/material.dart';
import 'package:project_5/core/all_file.dart';

class MyContainerBlogs extends StatelessWidget {
  const MyContainerBlogs(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.topTitle,
      required this.publishedAt});

  final String? title;
  final String? topTitle;
  final String? imagePath;
  final String? publishedAt;
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
              SizedBox(width: context.getWidthScreen(width: 0.02)),
              Image.asset(imagePath!, width: 150, height: 100),
              SizedBox(width: context.getWidthScreen(width: 0.02)),
              Flexible(
                child: Column(
                  children: [
                    Text(topTitle!,
                        style: const TextStyle(color: MyColors.greyTextColor)),
                    Text(title!,
                        style: const TextStyle(color: MyColors.whiteTextColor)),
                    SizedBox(height: context.getHeightScreen(height: 0.06)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: context.getWidthScreen(width: 0.02)),
              Text(publishedAt!,
                  style: const TextStyle(color: MyColors.whiteTextColor)),
              const Padding(
                padding: EdgeInsets.only(left: 80),
                child: Row(
                  children: [
                    Icon(Icons.bookmark_border, color: MyColors.whiteTextColor),
                    Icon(Icons.more_vert, color: MyColors.whiteTextColor),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
