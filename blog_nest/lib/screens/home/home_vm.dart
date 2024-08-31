import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../managers/blog_mgr.dart';
import '../../managers/nav_mgr.dart';
import '../../model/enum/blog_category.dart';

class HomeVM {
  final navMgr = GetIt.I.get<NavMgr>();
  final blogMgr = GetIt.I.get<BlogMgr>();
  late TabController tabController;

  HomeVM() {
    blogMgr.selectedCategory = BlogCategory.values.first;
  }

  void setSelectedCategory() =>
      blogMgr.selectedCategory = BlogCategory.values[tabController.index];
}
