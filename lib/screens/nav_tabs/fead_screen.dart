import 'package:blog_app/helper/screen.dart';
import 'package:blog_app/widget/high_lights.dart';
import 'package:blog_app/widget/story_card.dart';
import 'package:flutter/material.dart';

class FeadScreen extends StatefulWidget {
  const FeadScreen({
    super.key,
  });
  @override
  State<FeadScreen> createState() => _FeadScreenState();
}

class _FeadScreenState extends State<FeadScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        FeedContet(),
      ],
    );
  }
}

class FeedContet extends StatelessWidget {
  const FeedContet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HighLights(
          date: "Jul 10, 2023",
          title: "A month with DJI Mini 3 Pro",
          writer: "DJI",
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Top Stories", style: TextStyle(fontSize: 19)),
                TextButton(onPressed: () {}, child: const Text("See all"))
              ],
            ),
          ),
        ),
        ListView(
          shrinkWrap: true,
          children: const [
            StoryCard(
                writer: "writer",
                title: "title",
                date: "Jul 13, 2023",
                min: "2"),
          ],
        ),
      ],
    );
  }
}
