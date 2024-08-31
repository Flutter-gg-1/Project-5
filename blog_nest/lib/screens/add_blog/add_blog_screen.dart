import 'dart:io';
import 'package:blog_nest/extensions/icon_ext.dart';
import 'package:blog_nest/extensions/string_ext.dart';
import 'package:blog_nest/reusable_components/custom_text_field.dart';
import 'package:blog_nest/screens/add_blog/add_blog_vm.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../extensions/color_ext.dart';
import '../../extensions/img_ext.dart';
import '../../model/blog.dart';
import '../../model/enum/blog_category.dart';
import '../../utils/typedefs.dart';
import '../../utils/validations.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({super.key, this.blog});
  final Blog? blog;

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen>
    with SingleTickerProviderStateMixin {
  late final vm = AddBlogVM();

  @override
  void initState() {
    super.initState();

    vm.categoryController = TabController(
      initialIndex: 0,
      length: BlogCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    vm.categoryController.dispose();
    super.dispose();
  }

  void getImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    vm.selectedImg = File(img?.path ?? '');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      appBar: AppBar(
        backgroundColor: C.bg,
        leading: IconButton(
            onPressed: () => vm.navMgr.navigateBack(context: context),
            icon: const Icon(Icons.chevron_left).withSizeAndColor()),
        actions: [
          TextButton(
              onPressed: vm.addBlog,
              child: const Text('Post').styled(size: 17, weight: FW.w700)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Image
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CAL.start,
                    children: [
                      const Text('Image').styled(size: 17, weight: FW.w700),
                      const SizedBox(height: 16),
                      AspectRatio(
                        aspectRatio: 2,
                        child: Stack(
                          alignment: AL.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: vm.selectedImg == null
                                      ? ClipRRect(
                                          borderRadius: BR.circular(16),
                                          child: const Image(
                                              image: Img.blank,
                                              fit: BoxFit.cover))
                                      : ClipRRect(
                                          borderRadius: BR.circular(16),
                                          child: Image.file(vm.selectedImg!,
                                              fit: BoxFit.cover),
                                        ),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: getImage,
                                icon: const Icon(Icons.add).withSizeAndColor(
                                    size: 48, color: C.text2)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Title
                _TextFieldContainer(
                    controller: vm.titleController,
                    headerText: 'Title',
                    hintText: 'Enter your blog title'),
                _TextFieldContainer(
                    controller: vm.summaryController,
                    headerText: 'Summary',
                    hintText: 'Give a brief summary about your blog'),
                _TextFieldContainer(
                    controller: vm.contentController,
                    headerText: 'Content',
                    hintText: 'Wtire your blog here'),
                _CategoryTabView(controller: vm.categoryController),
                _TextFieldContainer(
                    controller: vm.readingMinController,
                    headerText: 'Reading minutes',
                    hintText: 'Minutes of reading this blog')
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TextFieldContainer extends StatelessWidget {
  const _TextFieldContainer({
    required this.controller,
    required this.headerText,
    required this.hintText,
  });
  final TextEditingController controller;
  final String headerText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CAL.start,
        children: [
          Text(headerText).styled(size: 17, weight: FW.w700),
          CustomTextField(
              controller: controller,
              hint: hintText,
              validation: Validations.emptyFieldValidation)
        ],
      ),
    );
  }
}

class _CategoryTabView extends StatelessWidget {
  const _CategoryTabView({required this.controller});
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CAL.start,
        children: [
          const Text('Select Category').styled(size: 17, weight: FW.w700),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBar(
              controller: controller,
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              dragStartBehavior: DragStartBehavior.down,
              dividerColor: Colors.transparent,
              tabs: BlogCategory.values
                  .map(
                    (cat) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(cat.titleStr()),
                    ),
                  )
                  .toList(),
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BR.circular(4),
                border: Border.all(color: Colors.white),
              ),
              labelColor: C.accent,
              labelStyle: const TextStyle(fontSize: 14),
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              unselectedLabelColor: C.text3,
            ),
          ),
        ],
      ),
    );
  }
}
