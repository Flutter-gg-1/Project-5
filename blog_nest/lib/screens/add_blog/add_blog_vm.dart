import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../managers/nav_mgr.dart';

class AddBlogVM {
  final navMgr = GetIt.I.get<NavMgr>();

  final titleController = TextEditingController();

  final summaryController = TextEditingController();

  final contentController = TextEditingController();

  late TabController categoryController;

  final readingMinController = TextEditingController();
}
