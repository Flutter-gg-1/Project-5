import 'package:blog_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../styles/colours.dart';

class CustomBlogTile extends StatelessWidget {
  final User user;
  final int index;
  const CustomBlogTile({super.key, required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Card(
        child: Image.asset('assets/images/1.png'),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            user.posts[index].title,
            style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colours.textSecondary),
          ),
          const Row(
            children: [Icon(Icons.edit), Icon(FontAwesome.trash_can)],
          )
        ],
      ),
    );
  }
}
