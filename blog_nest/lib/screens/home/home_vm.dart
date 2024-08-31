import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../managers/blog_mgr.dart';
import '../../managers/nav_mgr.dart';
import '../../managers/user_mgr.dart';
import '../../model/blog.dart';
import '../../model/enum/blog_category.dart';
import '../../model/user.dart';

class HomeVM {
  var navMgr = GetIt.I.get<NavMgr>();
  var blogMgr = GetIt.I.get<BlogMgr>();
  var userMgr = GetIt.I.get<UserMgr>();
  late TabController tabController;

  User? get currentUser {
    return userMgr.currentUser;
  }

  List<Blog> get blogs {
    return blogMgr.allBlogs;
  }

  HomeVM() {
    blogMgr.selectedCategory = BlogCategory.values.first;
  }

  void setSelectedCategory() =>
      blogMgr.selectedCategory = BlogCategory.values[tabController.index];
}
