import 'package:blog_nest/extensions/string_ext.dart';
import 'package:blog_nest/reusable_components/blog_cell_view.dart';
import 'package:flutter/material.dart';
import '../../extensions/color_ext.dart';
import '../../model/blog.dart';
import '../../utils/typedefs.dart';

class HomeContentView extends StatelessWidget {
  const HomeContentView({super.key, required this.blogs});
  final List<Blog> blogs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(top: 16),
        children: [
          const AspectRatio(aspectRatio: 2, child: Placeholder()),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MAL.spaceBetween,
              children: [
                const Text('Top Stories').styled(size: 16, weight: FW.w700),
                const Text('See all').styled(
                  size: 12,
                  weight: FW.w600,
                  color: C.text3,
                ),
              ],
            ),
          ),
          ...blogs.map((blog) => BlogCellView(blog: blog))
        ],
      ),
    );
  }
}
