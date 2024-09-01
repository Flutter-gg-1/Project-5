import 'package:blog_nest/extensions/string_ext.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../extensions/color_ext.dart';
import '../model/enum/blog_category.dart';
import '../utils/typedefs.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key, required this.controller});
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
              labelStyle: const TextStyle(fontSize: 14, fontWeight: FW.w700),
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              unselectedLabelColor: C.text3,
            ),
          ),
        ],
      ),
    );
  }
}
