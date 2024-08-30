import 'package:flutter/material.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                    image: const DecorationImage(
                        image: AssetImage("assets/Image (1).png")),
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
              title: const Text("DJI • Jul 10, 2023"),
              subtitle: const Text("A month with DJI Mini 3 Pro"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "Jul 13, 2023 • 2 min read",
                    style: TextStyle(color: Color(0xff888888), fontSize: 10),
                  ),
                  SizedBox(width: 130),
                  Icon(Icons.bookmark_border_outlined,
                      color: Color(0xff888888)),
                  Icon(Icons.more_vert_outlined, color: Color(0xff888888))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
