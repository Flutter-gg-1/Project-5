import 'package:flutter/material.dart';
import 'package:project_5/components/stories/stories.dart';
import 'package:project_5/components/text/text_custom.dart';
import 'package:project_5/components/textfield/custom_text_field.dart';
import 'package:project_5/data_layer/blog_data.dart';
import 'package:project_5/models/blog_model.dart';
import 'package:project_5/pages/blog_page.dart';
import 'package:project_5/services/setup.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController controllerSearch = TextEditingController();
  List<BlogModel> filteredBlogs = [];

  @override
  void initState() {
    super.initState();
    filteredBlogs = getIt.get<BlogData>().blogs;
    controllerSearch.addListener(_filterBlogs);
  }

  void _filterBlogs() {
    String query = controllerSearch.text.toLowerCase();
    setState(() {
      filteredBlogs = getIt
          .get<BlogData>()
          .blogs
          .where((blog) => blog.title.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    controllerSearch.removeListener(_filterBlogs);
    controllerSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: Column(
                children: [
                  CustomTextField(
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Color(0xffB8B8B8),
                        size: 26,
                      ),
                      hintText: "Search for News",
                      controller: controllerSearch,
                      minlines: 1),
                ],
              ),
            ),
            Expanded(
              child: filteredBlogs.isEmpty
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              size: 25,
                              color: Color(0xffB8B8B8),
                            ),
                            TextCustom(
                                text: "Search for a neeews",
                                color: Color(0xffB8B8B8),
                                weight: FontWeight.w400,
                                fontSize: 20)
                          ],
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: filteredBlogs.length,
                      itemBuilder: (context, index) {
                        BlogModel blog = filteredBlogs[index];
                        return Stories(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BlogPage(
                                            selectedId: blog.id,
                                          ))).then((onValue) {
                                if (onValue != null) {
                                  setState(() {});
                                }
                              });
                            },
                            imagePath:
                                "assets/STK156_Instagram_threads_2 2.png",
                            title: blog.title,
                            subtitle: blog.content,
                            date: blog.date,
                            readTime: blog.minutesToRead);
                      },
                    ),
            )
          ],
        ),
      )),
    );
  }
}
