import 'package:blog_nest/extensions/icon_ext.dart';
import 'package:blog_nest/extensions/string_ext.dart';
import 'package:blog_nest/managers/blog_mgr.dart';
import 'package:blog_nest/model/enum/blog_category.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../extensions/color_ext.dart';
import '../../managers/nav_mgr.dart';
import '../../managers/user_mgr.dart';
import '../../utils/typedefs.dart';

class BlogDetailsScreen extends StatelessWidget {
  BlogDetailsScreen({super.key});
  final navMgr = GetIt.I.get<NavMgr>();
  final blog = GetIt.I.get<BlogMgr>().selectedBlog;
  final users = GetIt.I.get<UserMgr>().allUsers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      appBar: AppBar(
        backgroundColor: C.bg,
        leading: IconButton(
            onPressed: () => navMgr.navigateBack(context: context),
            icon: const Icon(Icons.chevron_left).withSizeAndColor()),
        actions: [
          IconButton(
              onPressed: () => (),
              icon: const Icon(Icons.text_format).withSizeAndColor()),
          IconButton(
              onPressed: () => (),
              icon: const Icon(Icons.bookmark_outline).withSizeAndColor()),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 16),
              children: [
                const AspectRatio(aspectRatio: 2, child: Placeholder()),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.military_tech)
                                .withSizeAndColor(size: 16, color: C.accent),
                            const SizedBox(width: 8),
                            Text(blog?.category.titleStr() ?? '').styled(
                                size: 14, weight: FW.w600, color: C.accent),
                          ],
                        ),
                      ),
                      // Title
                      Text(blog?.title ?? '').styled(size: 20, weight: FW.w700),
                      // User Avatar
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: const ClipOval(child: Placeholder()),
                        ),
                      ),
                      // User Name
                      Text(users
                              .where((user) => user.id == blog?.authorId)
                              .toList()
                              .firstWhere((user) => true)
                              .name)
                          .styled(size: 14, weight: FW.w500, color: C.text2),
                      // Reading Minutes
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                                '${blog?.readingMinutes ?? 0} min read • ${blog?.timeStamp ?? '?'}')
                            .styled(size: 12, weight: FW.w500, color: C.text3),
                      ),
                      // Icons
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: InkWell(
                                onTap: () => (),
                                child: const Icon(Icons.facebook)
                                    .withSizeAndColor(
                                        size: 20, color: C.text2)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: InkWell(
                                onTap: () => (),
                                child: const Icon(Icons.facebook)
                                    .withSizeAndColor(
                                        size: 20, color: C.text2)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: InkWell(
                                onTap: () => (),
                                child: const Icon(Icons.facebook)
                                    .withSizeAndColor(
                                        size: 20, color: C.text2)),
                          ),
                        ],
                      ),
                      // Summary
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Column(
                          crossAxisAlignment: CAL.start,
                          children: [
                            const Text('Summary')
                                .styled(size: 16, weight: FW.w600),
                            const SizedBox(height: 16),
                            Text(blog?.summary ?? '').styled(
                                size: 14, weight: FW.w400, color: C.text2),
                          ],
                        ),
                      ),
                      // Content
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Column(
                          crossAxisAlignment: CAL.start,
                          children: [
                            const Text('Content')
                                .styled(size: 16, weight: FW.w600),
                            const SizedBox(height: 16),
                            Text(blog?.content ?? '').styled(
                                size: 14, weight: FW.w400, color: C.text2),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
