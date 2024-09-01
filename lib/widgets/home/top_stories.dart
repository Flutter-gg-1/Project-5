import 'package:blog_app/data/blog_data.dart';
import 'package:blog_app/models/blog.dart';
import 'package:blog_app/widgets/home/blog_card.dart';
import 'package:blog_app/widgets/home/drone.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TopStories extends StatelessWidget {
  final String category;
  final Function(Blog blog) onSaved;
  const TopStories({super.key, required this.onSaved, required this.category});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Drone(),
          Divider(
            color: Colors.white.withOpacity(0.1),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Stories",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "See all",
                style: TextStyle(color: Color(0xff888888), fontSize: 12),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: GetIt.I.get<BlogData>().blogs.where(
              (element) {
                return element.category == category;
              },
            ).map((blog) {
              return BlogCard(blog: blog, onSaved: onSaved(blog));
            }).toList(),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
