import 'package:blog_app/data/app_data.dart';
import 'package:blog_app/widgets/home/blog_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SaveListScreen extends StatefulWidget {
  const SaveListScreen({super.key});

  @override
  State<SaveListScreen> createState() => _SaveListScreenState();
}

class _SaveListScreenState extends State<SaveListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Saved News",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                GetIt.I.get<AppData>().savedBlogs.isEmpty
                    ? const Column(
                        children: [
                          SizedBox(
                            height: 300,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "No news found",
                                style: TextStyle(color: Color(0xffB8B8B8)),
                              )
                            ],
                          )
                        ],
                      )
                    : Column(
                        children: GetIt.I.get<AppData>().savedBlogs.map((blog) {
                          return BlogCard(
                            blog: blog,
                            onSaved: () {
                              GetIt.I.get<AppData>().savedBlogs.contains(blog)
                                  ? {
                                      GetIt.I
                                          .get<AppData>()
                                          .savedBlogs
                                          .remove(blog),
                                    }
                                  : {
                                      GetIt.I
                                          .get<AppData>()
                                          .savedBlogs
                                          .add(blog),
                                    };
                              setState(() {});
                            },
                          );
                        }).toList(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
