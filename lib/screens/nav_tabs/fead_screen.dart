import 'package:blog_app/widget/story_card.dart';
import 'package:flutter/material.dart';

class FeadScreen extends StatefulWidget {
  const FeadScreen({super.key});

  @override
  State<FeadScreen> createState() => _FeadScreenState();
}

class _FeadScreenState extends State<FeadScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
          shrinkWrap: true,
          children: const [
            StoryCard(
                writer: "writer",
                title: "title",
                date: "Jul 13, 2023",
                min: "2"),
          ],
        );
  }
}