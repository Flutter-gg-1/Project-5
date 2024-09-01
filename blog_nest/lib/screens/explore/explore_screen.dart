import 'package:blog_nest/extensions/icon_ext.dart';
import 'package:blog_nest/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import '../../extensions/color_ext.dart';
import '../../reusable_components/blog_cell/blog_cell_view.dart';
import '../../reusable_components/custom_text_field.dart';
import '../../utils/typedefs.dart';
import '../../utils/validations.dart';
import 'explore_vm.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final vm = ExploreVM();
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  style: const TextStyle(color: C.text1),
                  onChanged: (value) {
                    setState(() => vm.searchText = value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: C.metal,
                    hintText: 'Search for News',
                    hintStyle: const TextStyle(
                        color: C.text3, fontSize: 15, fontWeight: FW.w500),
                    prefixIcon:
                        Icon(Icons.search).withSizeAndColor(color: C.text3),
                  ),
                ),
              ),
              if (vm.filteredBlogs.isEmpty)
                Expanded(
                  child: Row(
                    crossAxisAlignment: CAL.center,
                    mainAxisAlignment: MAL.center,
                    children: [
                      const Icon(Icons.search).withSizeAndColor(color: C.text3),
                      const SizedBox(width: 16),
                      const Text('Search for news')
                          .styled(size: 20, color: C.text3),
                    ],
                  ),
                )
              else
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: vm.filteredBlogs
                              .map((blog) =>
                                  BlogCellView(blog: blog, setState: callBack))
                              .toList()),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
