import 'package:flutter/material.dart';
import 'package:project5/extensions/screen_push.dart';
import 'package:project5/models/post.dart';
import 'package:project5/screens/view_post_screen.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final Function()? onTap;
  const PostCard({super.key, required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 111,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xff1e1e1e),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(post.postImage, width: 80, height: 62,fit: BoxFit.cover),
                const SizedBox(width: 8),
                SizedBox(
                  width: 239,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(post.authorName,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xffb8b8b8)),),
                      Text(post.title,style: const TextStyle(letterSpacing: -0.41,fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xffe8e8e8)),),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(post.date,style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color(0xff888888)),),
                    Text("• ${post.minutesToRead} min read",style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color(0xff888888)),),
                  ],
                ),
                Row(
                  children: [
                    InkWell(onTap: () {print("Icon");},child: const Icon(Icons.bookmark_border,color: Color(0xff888888),)),
                    const Icon(Icons.more_vert,color: Color(0xff888888),)
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