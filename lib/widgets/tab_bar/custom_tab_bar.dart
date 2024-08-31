import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: ColorExt.grey,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: ColorExt.red,
      labelColor: ColorExt.white,
      labelPadding: EdgeInsets.zero,
      labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      tabs: const [
        Text("Tech"),
        Text("AI"),
        Text("Cloud"),
        Text("Robotics"),
        Text("IoT"),
      ],
    );
  }
}
