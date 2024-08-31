import 'package:blog_app/models/user.dart';
import 'package:blog_app/services/setup.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../data/blog_data.dart';
import '../styles/colours.dart';

class CustomBlogTile extends StatelessWidget {
  final User user;
  final int index;
  final Function()? onTap;
  final Function()? onEdit;
  final Function()? onDelete;
  const CustomBlogTile(
      {super.key,
      required this.user,
      required this.index,
      this.onEdit,
      this.onTap,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        height: 62,
        width: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), image: DecorationImage(image: AssetImage(user.posts[index].image ?? 'assets/images/default.png'))),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.posts[index].title,
            style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colours.textSecondary),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: onEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 12,
              ),
              IconButton(
                onPressed: onDelete,
                icon: const Icon(
                  FontAwesome.trash_can,
                  color: Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
