import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget(
      {super.key,
      this.onTap,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.date,
      required this.min});
  final Function()? onTap;
  final String? image;
  final String title;
  final String subTitle;
  final String date;
  final String min;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        width: 343,
        height: 108,
        decoration: BoxDecoration(
            color: const Color(0xff1E1E1E),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image ?? '')),
                    borderRadius: BorderRadius.circular(5)),
                width: 80,
                height: 62,
              ),
              titleTextStyle:
                  const TextStyle(color: Color(0xffB8B8B8), fontSize: 12),
              subtitleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              title: Text(subTitle),
              subtitle: Text(title),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "$date • $min min read",
                    style:
                        const TextStyle(color: Color(0xff888888), fontSize: 10),
                  ),
                  const SizedBox(width: 100),
                  const Icon(Icons.bookmark_border_outlined,
                      color: Color(0xff888888)),
                  const Icon(Icons.more_vert_outlined, color: Color(0xff888888))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
