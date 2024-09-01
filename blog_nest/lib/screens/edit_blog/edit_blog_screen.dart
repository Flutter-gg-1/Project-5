import 'package:blog_nest/extensions/icon_ext.dart';
import 'package:blog_nest/extensions/string_ext.dart';
import 'package:blog_nest/screens/edit_blog/edit_blog_vm.dart';
import 'package:flutter/material.dart';
import '../../extensions/color_ext.dart';
import '../../model/blog.dart';
import '../../model/enum/blog_category.dart';
import '../../reusable_components/category_tab_view.dart';
import '../../reusable_components/custom_form_text_field.dart';
import '../../utils/typedefs.dart';

class EditBlogScreen extends StatefulWidget {
  const EditBlogScreen({super.key, required this.blog});
  final Blog blog;

  @override
  State<EditBlogScreen> createState() => _EditBlogScreenState();
}

class _EditBlogScreenState extends State<EditBlogScreen>
    with SingleTickerProviderStateMixin {
  final vm = EditBlogVM();

  @override
  void initState() {
    super.initState();

    vm.categoryController = TabController(
      initialIndex: BlogCategory.values.indexOf(widget.blog.category),
      length: BlogCategory.values.length,
      vsync: this,
    );

    vm.titleController.text = widget.blog.title;
    vm.summaryController.text = widget.blog.summary;
    vm.contentController.text = widget.blog.content;
    vm.readingMinController.text = widget.blog.readingMinutes.toString();
    setState(() {});
  }

  @override
  void dispose() {
    vm.categoryController.dispose();
    super.dispose();
  }

  void _editBlog(BuildContext context, Blog blog) {
    vm.editBlog(blog);
    vm.navMgr.navigateBack(context: context);
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
              onPressed: () => _editBlog(context, widget.blog),
              child: const Text('Save').styled(size: 17, weight: FW.w700)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                CustomFormTextField(
                    controller: vm.titleController,
                    headerText: 'Title',
                    hintText: 'Enter your blog title'),
                CustomFormTextField(
                  controller: vm.summaryController,
                  headerText: 'Summary',
                  hintText: 'Give a brief summary about your blog',
                  minLines: 3,
                  maxLines: 4,
                ),
                CustomFormTextField(
                  controller: vm.contentController,
                  headerText: 'Content',
                  hintText: 'Write your blog here',
                  minLines: 8,
                  maxLines: null,
                ),
                CategoryTabView(controller: vm.categoryController),
                CustomFormTextField(
                    controller: vm.readingMinController,
                    headerText: 'Reading minutes',
                    hintText: 'Minutes of reading this blog')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
