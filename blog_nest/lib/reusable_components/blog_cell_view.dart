import 'package:blog_nest/extensions/icon_ext.dart';
import 'package:blog_nest/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import '../extensions/color_ext.dart';
import '../model/blog.dart';
import '../utils/typedefs.dart';

class BlogCellView extends StatelessWidget {
  const BlogCellView({super.key, required this.blog, this.hasHeader = false});

  final Blog blog;
  final bool hasHeader;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: C.itemBg,
          borderRadius: BR.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CAL.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Placeholder(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 4,
                    child: AspectRatio(
                      aspectRatio: 4,
                      child: Column(
                        mainAxisAlignment: MAL.spaceBetween,
                        crossAxisAlignment: CAL.start,
                        children: [
                          const Text('Hello').styled(
                            size: 12,
                            weight: FW.w500,
                            color: C.text2,
                            lineLimit: 1,
                          ),
                          const Text(
                                  "Now Google's Bard AI can talk & respond to visual prompts")
                              .styled(
                            size: 16,
                            weight: FW.w600,
                            lineLimit: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MAL.spaceBetween,
                children: [
                  const Text('Jul 13, 2023 • 2 min read').styled(
                    color: C.text3,
                    size: 10,
                    weight: FW.w500,
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () => (),
                          child: const Icon(
                            Icons.bookmark_outline,
                            color: C.text3,
                          ).withSizeAndColor(size: 28, color: C.text3)),
                      InkWell(
                          onTap: () => (),
                          child: const Icon(Icons.more_vert, color: C.text3)
                              .withSizeAndColor(size: 28, color: C.text3)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
