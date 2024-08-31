import 'package:flutter/material.dart';

class UserBlog extends StatelessWidget {
  const UserBlog(
      {super.key,
      this.onTap,
      required this.image,
      required this.title,
      this.onEdit,
      this.onDelete});
  final Function()? onTap;
  final String? image;
  final String title;
  final Function()? onDelete;
  final Function()? onEdit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        width: 343,
        height: 104,
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
              titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              title: Text(title),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: onEdit,
                      color: const Color(0xff888888)),
                  IconButton(
                      icon: const Icon(Icons.delete_outline_outlined,
                          color: Color(0xff888888)),
                      onPressed: onDelete)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
