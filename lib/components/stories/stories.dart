import 'package:flutter/material.dart';
import 'package:project_5/components/text/text_custom.dart';

class Stories extends StatelessWidget {
  const Stories(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.date,
      required this.readTime,
      this.onPressed});
  final String imagePath;
  final String title;
  final String subtitle;
  final String date;
  final String readTime;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      width: 343,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xff1E1E1E)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 327,
              height: 62,
              child: Row(
                children: [
                  Image.asset(imagePath),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                          text: title,
                          color: const Color(0xffB8B8B8),
                          weight: FontWeight.w500,
                          fontSize: 12),
                      SizedBox(
                        width: 222,
                        height: 36,
                        child: TextCustom(
                            text: subtitle,
                            color: const Color(0xffE8E8E8),
                            weight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustom(
                    text: "$date • $readTime",
                    color: const Color(0xff888888),
                    weight: FontWeight.w500,
                    fontSize: 12),
                Row(
                  children: [
                    IconButton(
                        onPressed: onPressed,
                        icon: const Icon(
                          Icons.bookmark_border,
                          color: Color(0xff888888),
                        )),
                    const SizedBox(
                      width: 12,
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: Color(0xff888888),
                    )
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
