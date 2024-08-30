import 'package:blog_app/helper/screen.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.writer,
    required this.title,
    required this.date,
    required this.min,
    this.onTap,
  });
  final String writer;
  final String title;
  final String date;
  final String min;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: ListTile(
                leading: SizedBox(
                  height: context.getHight(value: .1),
                  width: context.getWidth(value: .2),
                  child: const Placeholder(),
                ),
                title: Text(
                    style: const TextStyle(color: Color(0xffB8B8B8)), writer),
                subtitle: Text(
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    title),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    style: const TextStyle(color: Color(0xffB8B8B8)),
                    "$date . $min to read"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_border),
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_vert)),
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
