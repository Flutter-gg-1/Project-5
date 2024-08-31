import 'package:blog_app/screens/feeds/ai_feed.dart';
import 'package:blog_app/screens/feeds/cloud_feed.dart';
import 'package:blog_app/screens/feeds/iot_feed.dart';
import 'package:blog_app/screens/feeds/robotics_feed.dart';
import 'package:blog_app/screens/feeds/technology_feed.dart';
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
        TechnologyFeed(),
        AiFeed(),
        CloudFeed(),
        RoboticsFeed(),
        IotFeed()
      ],
    );
  }
}
