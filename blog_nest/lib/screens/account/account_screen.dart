import 'package:blog_nest/extensions/string_ext.dart';
import 'package:blog_nest/screens/account/subviews/account_blog_cell_view.dart';
import 'package:blog_nest/screens/account/subviews/account_header_cell_view.dart';
import 'package:flutter/material.dart';
import '../../extensions/color_ext.dart';
import '../../reusable_components/custom_btn_view.dart';
import '../../utils/typedefs.dart';
import 'account_vm.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final vm = AccountVM();
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
              const Text('Account').styled(size: 20, weight: FW.w700),
              if (vm.currentUser == null)
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
                              CustomBtnView(
                                  isLogin: true,
                                  callBack: () => vm.signOut(context)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              else
                Expanded(
                  child: Column(
                    crossAxisAlignment: CAL.start,
                    children: [
                      AccountHeaderCellView(user: vm.currentUser),
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
                          children: vm.blogs
                              .map((blog) => AccountBlogCellView(
                                  blog: blog, setState: callBack))
                              .toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: MAL.center,
                          children: [
                            CustomBtnView(
                                isLogin: false,
                                callBack: () => vm.signOut(context)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
