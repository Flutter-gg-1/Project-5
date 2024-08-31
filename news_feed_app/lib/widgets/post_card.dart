
import 'package:flutter/material.dart';
import 'package:news_feed_app/screens/blog.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({super.key, required this.title, required this.username, required this.imgPath, required this.dateAndTime});
  final String title;
  final String username;
  final String imgPath;
  final String dateAndTime;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xff1E1E1E),
        ),
        child: InkWell(
           onTap: () {
             Navigator.push(context,  MaterialPageRoute(builder: (context) => const BlogPage()));
           },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // Aligns items at the top
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      width: 80,
                      height: 62,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Color(0xffffffff),
                      ),
                      child: Image.asset(imgPath, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 8),
                     Expanded( 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          Text(
                            username,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff888888)),
                          ),
                          Text(
                            title,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
                            maxLines: 2, 
                            overflow: TextOverflow.ellipsis, 
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Text(
                      dateAndTime,
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xff888888)),
                    ),
                    const Spacer(),
                    const Row(
                      children: [
                        Icon(Icons.bookmark_border, color: Color(0xff888888),),
                        Icon(Icons.more_vert, color: Color(0xff888888),),
                      ],
                    )        
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}