import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project5/models/post.dart';

class PostCard extends StatefulWidget {
  final Post post;
  final Function()? onTap;
  final Function()? onSave;
  const PostCard({super.key, required this.post, required this.onTap, this.onSave});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
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
                widget.post.postImage.contains('assets') ?
                Image.asset(widget.post.postImage, width: 80, height: 62,fit: BoxFit.cover)
                : Image.file(File(widget.post.postImage), width: 80, height: 62,fit: BoxFit.cover,),
                const SizedBox(width: 8),
                SizedBox(
                  width: 239,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.post.authorName,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xffb8b8b8)),),
                      Text(widget.post.title,style: const TextStyle(letterSpacing: -0.41,fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xffe8e8e8)),),
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
                    Text(widget.post.date,style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color(0xff888888)),),
                    Text("• ${widget.post.minutesToRead} min read",style: const TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color(0xff888888)),),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: widget.onSave,
                      child: Icon(
                        widget.post.isSaved? Icons.bookmark
                        : Icons.bookmark_border,
                        color: const Color(0xff888888)
                      )
                    ),
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