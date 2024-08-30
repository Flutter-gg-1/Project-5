import 'package:blog_nest/extensions/string_ext.dart';
import 'package:blog_nest/managers/user_mgr.dart';
import 'package:blog_nest/screens/account/account_blog_cell_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../extensions/color_ext.dart';
import '../../model/blog.dart';
import '../../model/user.dart';
import '../../reusable_components/custom_btn_view.dart';
import '../../utils/typedefs.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});
  final User? user = GetIt.I.get<UserMgr>().currentUser;
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
              const Text('Account').styled(size: 20, weight: FW.w700),
              if (user == null)
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: C.itemBg, borderRadius: BR.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                            mainAxisAlignment: MAL.spaceBetween,
                            children: [
                              const Text('You are not logged in yet')
                                  .styled(size: 12, weight: FW.w700),
                              CustomBtnView(isLogin: false, callBack: () => ()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              else
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: AspectRatio(
                        aspectRatio: 5,
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Placeholder(),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment: MAL.center,
                                crossAxisAlignment: CAL.start,
                                children: [
                                  Text(user?.name ?? '').styled(
                                      size: 14,
                                      weight: FW.w500,
                                      color: C.text2),
                                  const SizedBox(height: 4),
                                  Text(user?.jobTitle ?? '').styled(
                                      size: 10,
                                      weight: FW.w500,
                                      color: C.text2),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          const Text('My Blogs')
                              .styled(size: 18, weight: FW.w700),
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView(
                      children: blogs
                          .where((blog) => blog.authorId == user?.id)
                          .map((blog) => AccountBlogCellView(blog: blog))
                          .toList(),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MAL.center,
                        children: [
                          CustomBtnView(isLogin: true, callBack: () => ()),
                        ],
                      ),
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
