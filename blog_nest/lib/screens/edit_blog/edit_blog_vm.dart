import 'package:blog_nest/extensions/date_ext.dart';
import 'package:blog_nest/managers/nav_mgr.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../managers/blog_mgr.dart';
import '../../managers/user_mgr.dart';
import '../../model/blog.dart';
import '../../model/enum/blog_category.dart';
import '../../model/user.dart';

class EditBlogVM {
  var userMgr = GetIt.I.get<UserMgr>();
  var blogMgr = GetIt.I.get<BlogMgr>();
  var navMgr = GetIt.I.get<NavMgr>();

  User? get currentUser => userMgr.currentUser;

  final titleController = TextEditingController();

  final summaryController = TextEditingController();

  final contentController = TextEditingController();

  late TabController categoryController;

  final readingMinController = TextEditingController();

  void editBlog(Blog blog) async {
    var updatedBlog = Blog(
      id: blog.id,
      title: titleController.text,
      summary: summaryController.text,
      content: contentController.text,
      category: BlogCategory.values[categoryController.index],
      readingMinutes: int.tryParse(readingMinController.text) ?? 0,
      timeStamp: DateTime.now().toFormattedString(),
      imgData: blog.imgData,
      authorId: blog.authorId,
    );

    await blogMgr.removeBlog(blogId: blog.id);
    await blogMgr.addNewBlog(updatedBlog);
  }
}
