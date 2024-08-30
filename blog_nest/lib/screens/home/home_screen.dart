import 'package:blog_nest/extensions/icon_ext.dart';
import 'package:blog_nest/screens/home/home_content_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../extensions/color_ext.dart';
import '../../managers/nav_mgr.dart';
import '../../model/blog.dart';
import '../../model/enum/blog_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final navMgr = GetIt.I.get<NavMgr>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: 0,
      length: BlogCategory.values.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: C.itemBg,
          leading: IconButton(
              onPressed: () => (),
              icon: const Icon(Icons.menu).withSizeAndColor()),
          actions: [
            IconButton(
                onPressed: () => (),
                icon: const Icon(Icons.search).withSizeAndColor()),
            IconButton(
                onPressed: () => navMgr.navigate(
                    context: context, dest: Destination.addBlog),
                icon: const Icon(Icons.add).withSizeAndColor())
          ],
          bottom: TabBar(
              controller: tabController,
              tabs: BlogCategory.values
                  .map((cat) => Text(cat.tabStr()))
                  .toList())),
      backgroundColor: C.bg,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TabBarView(
          controller: tabController,
          children: List.generate(
            BlogCategory.values.length,
            (_) => HomeContentView(blogs: Blog.defaultBlogs),
          ),
        ),
      ),
    );
  }
}
