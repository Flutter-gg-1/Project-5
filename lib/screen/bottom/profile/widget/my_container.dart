import 'package:flutter/material.dart';
import 'package:project_5/core/all_file.dart';

class MyContainerBlog extends StatelessWidget {
  const MyContainerBlog({super.key, this.text, this.imagePath});

  final String? text;
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      width: context.getWidthScreen(width: 0.9),
      height: context.getHeightScreen(height: 0.2),
      color: MyColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  width: context.getWidthScreen(width: 0.21),
                  height: context.getHeightScreen(height: 0.11),
                  decoration: BoxDecoration(
                    color: MyColors.whiteTextColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(imagePath!, fit: BoxFit.cover)),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(text!,
                      style: const TextStyle(color: MyColors.whiteTextColor)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
