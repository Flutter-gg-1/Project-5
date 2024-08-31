import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../managers/nav_mgr.dart';
import 'package:image_picker/image_picker.dart';

class AddBlogVM {
  final navMgr = GetIt.I.get<NavMgr>();

  File? selectedImg;

  void getImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImg = File(img?.path ?? '');
    // setState(() {
    //
    // });
  }

  final titleController = TextEditingController();

  final summaryController = TextEditingController();

  final contentController = TextEditingController();

  late TabController categoryController;

  final readingMinController = TextEditingController();
}
