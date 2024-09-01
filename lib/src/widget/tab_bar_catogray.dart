import 'package:flutter/material.dart';

class tab_bar_catogray extends StatelessWidget {
  const tab_bar_catogray({
    super.key,
    required TabController? tabController,
  }) : _tabController = tabController;

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      indicatorColor: Colors.red,
      tabs: const [
        Tab(text: "Tech"),
        Tab(text: "AI"),
        Tab(text: "Cloud"),
        Tab(text: "Robotics"),
        Tab(text: "IoT"),
      ],
    );
  }
}

