import 'package:blog_nest/extensions/string_ext.dart';
import 'package:blog_nest/managers/blog_mgr.dart';
import 'package:blog_nest/reusable_components/blog_cell/blog_cell_view.dart';
import 'package:blog_nest/screens/bookmarks/bookmarks_vm.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../extensions/color_ext.dart';
import '../../model/blog.dart';
import '../../utils/typedefs.dart';

class BookmarksScreen extends StatefulWidget {
  BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  var vm = BookmarksVM();
  void callBack() => setState(() => ());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CAL.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child:
                    const Text('Saved News').styled(size: 20, weight: FW.w700),
              ),
              if (vm.blogs.isEmpty)
                Expanded(
                  child: Row(
                    crossAxisAlignment: CAL.center,
                    mainAxisAlignment: MAL.center,
                    children: [
                      const Text('No news found')
                          .styled(size: 20, color: C.text3),
                    ],
                  ),
                )
              else
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: vm.blogs
                            .map((blog) =>
                                BlogCellView(blog: blog, setState: callBack))
                            .toList(),
                      ),
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
