import 'package:flutter/material.dart';
import 'package:project_5/core/all_file.dart';

class MyContainerBlogs extends StatelessWidget {
  const MyContainerBlogs({super.key, this.text, this.imagePath});

  final String? text;
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: context.getHeightScreen(height: 0.2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: MyColors.whiteTextColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: context.getWidthScreen(width: 0.3),
                  height: context.getHeightScreen(height: 0.11),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(imagePath!, fit: BoxFit.cover),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(text!,
                        style: const TextStyle(color: MyColors.whiteTextColor)),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.getHeightScreen(height: 0.02)),
            const Row(
              children: [],
            ),
          ],
        ));
  }
}
