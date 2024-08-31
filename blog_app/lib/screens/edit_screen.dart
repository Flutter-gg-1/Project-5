import 'package:blog_app/data/post_data.dart';

import 'package:blog_app/models/post_model.dart';
import 'package:blog_app/widgets/fields/info_feild.dart';
import 'package:blog_app/widgets/buttons/selectable_box.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EditScreen extends StatelessWidget {
  final String id;
  final String category;
  final String title;
  final String summary;
  final String content;
  final String min;
  const EditScreen(
      {super.key,
      required this.category,
      required this.title,
      required this.summary,
      required this.content,
      required this.min,
      required this.id});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController sumController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    TextEditingController minController = TextEditingController();
    String catValue = "";

    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        actions: [
          TextButton(
              onPressed: () {
                GetIt.I.get<PostData>().editPost(
                    id: id,
                    title: title,
                    summary: summary,
                    content: content,
                    category: category,
                    minutes: min);
                Navigator.pop(context, true);
              },
              child: const Text(
                "Post",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              InfoFeild(
                  title: "Title",
                  hint: "Enter your blog title",
                  controller: titleController),
              const SizedBox(height: 20),
              InfoFeild(
                title: "Summary",
                hint: "Enter your blog Summary",
                minLines: 3,
                controller: sumController,
              ),
              const SizedBox(height: 20),
              InfoFeild(
                title: "Content",
                hint: "Enter your blog Content",
                minLines: 6,
                controller: contentController,
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(width: 3),
                  Text("*", style: TextStyle(color: Colors.red)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableBox(
                    category: 'TECHNOLOGY',
                    onTap: () {
                      catValue = "TECHNOLOGY";
                    },
                  ),
                  const SizedBox(width: 5),
                  SelectableBox(
                    category: 'AI',
                    onTap: () {
                      catValue = "AI";
                    },
                  ),
                  const SizedBox(width: 5),
                  SelectableBox(
                    category: 'CLOUD',
                    onTap: () {
                      catValue = "CLOUD";
                    },
                  ),
                  const SizedBox(width: 5),
                  SelectableBox(
                    category: 'ROBOTIC',
                    onTap: () {
                      catValue = "ROBOTIC";
                    },
                  ),
                  const SizedBox(width: 5),
                  SelectableBox(
                    category: 'IOT',
                    onTap: () {
                      catValue = "IOT";
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              InfoFeild(
                title: "Reading minutes",
                hint: "Minutes of reading this blog",
                controller: minController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
