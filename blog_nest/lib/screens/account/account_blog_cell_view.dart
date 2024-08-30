import 'package:blog_nest/extensions/icon_ext.dart';
import 'package:blog_nest/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import '../../extensions/color_ext.dart';
import '../../model/blog.dart';
import '../../utils/typedefs.dart';

class AccountBlogCellView extends StatelessWidget {
  const AccountBlogCellView({super.key, required this.blog});
  final Blog blog;

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
            mainAxisAlignment: MAL.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(
                    flex: 3,
                    child: AspectRatio(
                      aspectRatio: 1.4,
                      child: Placeholder(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 7,
                    child: AspectRatio(
                      aspectRatio: 4,
                      child: Column(
                        mainAxisAlignment: MAL.spaceBetween,
                        crossAxisAlignment: CAL.start,
                        children: [
                          Text(blog.title).styled(
                            size: 11,
                            weight: FW.w600,
                            lineLimit: 2,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                  onTap: () => (),
                                  child: const Icon(Icons.edit, color: C.text3)
                                      .withSizeAndColor(
                                          size: 16, color: C.text3)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => (),
                    child: const Icon(Icons.delete_outline, color: C.text3)
                        .withSizeAndColor(size: 16, color: C.red),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
