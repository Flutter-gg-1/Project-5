import 'package:blog_nest/extensions/string_ext.dart';
import 'package:blog_nest/reusable_components/blog_cell_view.dart';
import 'package:flutter/material.dart';
import '../../extensions/color_ext.dart';
import '../../model/blog.dart';
import '../../utils/typedefs.dart';

class BookmarksScreen extends StatelessWidget {
  BookmarksScreen({super.key});
  final List<Blog> blogs = Blog.defaultBlogs;

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
              if (blogs.isEmpty)
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
                        children: blogs
                            .map((blog) => BlogCellView(blog: blog))
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
