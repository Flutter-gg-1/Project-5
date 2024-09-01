import 'package:flutter/material.dart';

class Tech extends StatelessWidget {
  final String name;
  final String title;
  final String date;

  Tech({
    super.key,
    required this.name,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xff1e1e1e),
        borderRadius: BorderRadius.circular(8),
      ),
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              name,
              style: const TextStyle(fontSize: 14, color: Color(0xff919191)),
            ),
            subtitle: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Container(
              height: 100,
              width: 80,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              child: Image.asset(
                'lib/gust_page/images/STK156_Instagram_threads_2 2.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff919191),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_outline),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
