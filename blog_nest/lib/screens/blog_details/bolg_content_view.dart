import 'package:blog_nest/extensions/string_ext.dart';
import 'package:flutter/material.dart';

import '../../model/blog.dart';
import '../../utils/typedefs.dart';

class BlogContentView extends StatelessWidget {
  const BlogContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(top: 16),
        children: [
          AspectRatio(aspectRatio: 2, child: Placeholder()),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Blog.defaultBlogs.first.title)
                    .styled(size: 20, weight: FW.w700),
                Text('Hello').styled(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
