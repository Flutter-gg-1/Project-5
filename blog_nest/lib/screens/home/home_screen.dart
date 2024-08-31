import 'package:blog_nest/extensions/icon_ext.dart';
import 'package:blog_nest/screens/home/subviews/home_content_view.dart';
import 'package:flutter/material.dart';
import '../../extensions/color_ext.dart';
import '../../managers/nav_mgr.dart';
import '../../model/enum/blog_category.dart';
import '../../utils/typedefs.dart';
import 'home_vm.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late HomeVM vm;
  void callBack() => setState(() {});

  @override
  void initState() {
    super.initState();
    vm = HomeVM();
    vm.tabController = TabController(
      initialIndex: 0,
      length: BlogCategory.values.length,
      vsync: this,
    );
    setState(() {});
  }

  @override
  void dispose() {
    vm.tabController.dispose();
    super.dispose();
  }

  void _changeFilter() {
    setState(() => vm.setSelectedCategory());
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
              onPressed: () => vm.navMgr
                  .navigate(context: context, dest: Destination.addBlog),
              icon: const Icon(Icons.add).withSizeAndColor())
        ],
        bottom: TabBar(
          indicatorColor: C.red,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: C.text1,
          unselectedLabelColor: C.text3,
          labelPadding: EI.only(bottom: 8),
          dividerHeight: 0.1,
          dividerColor: C.text3,
          controller: vm.tabController,
          tabs: BlogCategory.values.map((cat) => Text(cat.tabStr())).toList(),
          onTap: (idx) => _changeFilter(),
        ),
      ),
      backgroundColor: C.bg,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TabBarView(
          controller: vm.tabController,
          children: BlogCategory.values.map((category) {
            return HomeContentView(
                blogs: vm.blogMgr.categoryBlogs, setState: callBack);
          }).toList(),
        ),
      ),
    );
  }
}
