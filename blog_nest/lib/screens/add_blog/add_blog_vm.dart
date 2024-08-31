import 'dart:io';
import 'dart:math';
import 'package:blog_nest/extensions/date_ext.dart';
import 'package:blog_nest/managers/blog_mgr.dart';
import 'package:blog_nest/managers/user_mgr.dart';
import 'package:blog_nest/model/blog.dart';
import 'package:blog_nest/model/enum/blog_category.dart';
import 'package:blog_nest/utils/img_converter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../extensions/img_ext.dart';
import '../../managers/nav_mgr.dart';

class AddBlogVM {
  final navMgr = GetIt.I.get<NavMgr>();
  final blogMgr = GetIt.I.get<BlogMgr>();
  final currentUser = GetIt.I.get<UserMgr>().currentUser;

  File? selectedImg;

  final titleController = TextEditingController();

  final summaryController = TextEditingController();

  final contentController = TextEditingController();

  late TabController categoryController;

  final readingMinController = TextEditingController();

  static String? emptyFieldValidation(String value) {
    final regex = RegExp(r'^[a-zA-Z\s]+$');
    if (regex.hasMatch(value) || value.isEmpty) {
      // Valid email address
      return null;
    } else {
      // Invalid email address
      return 'This Field Cannot be Empty';
    }
  }

  void addBlog() async {
    String imgData = selectedImg != null
        ? await ImgConverter.fileImgToBase64(selectedImg!)
        : await ImgConverter.assetImgToData(Img.blank);

    blogMgr.addNewBlog(
      Blog(
        id: 10 + Random().nextInt(500),
        title: titleController.text,
        summary: summaryController.text,
        content: contentController.text,
        category: BlogCategory.values[categoryController.index],
        readingMinutes: int.tryParse(readingMinController.text) ?? 0,
        timeStamp: DateTime.now().toFormattedString(),
        imgData: imgData,
        authorId: currentUser?.id ?? -1,
      ),
    );
  }
}
