import 'package:blog_app/data_layer/get_blog.dart';
import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/widget/button/textfield/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class EditBlog extends StatelessWidget {
  const EditBlog({super.key, required this.blog});
  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController titleFieldController = TextEditingController();

    TextEditingController summaryFieldController = TextEditingController();

    TextEditingController contetFieldController = TextEditingController();

    TextEditingController readingMinFieldController = TextEditingController();

    titleFieldController.text = blog.title;
    summaryFieldController.text = blog.summary;

    contetFieldController.text = blog.content;
    readingMinFieldController.text = blog.minutesToRead;

    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.bottomRight,
          child: Text("Post"),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Title"),
                Card(
                  child: CustomTextFormField(
                    hintText: "Enter your blog title",
                    onChanged: (p0) {},
                    userTextcontroller: titleFieldController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                  ),
                ),
                const Text("Summary"),
                Card(
                  child: CustomTextFormField(
                    maxLines: 4,
                    hintText: "Give a brief summary about your blog ",
                    onChanged: (p0) {},
                    userTextcontroller: summaryFieldController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                  ),
                ),
                const Text("Content"),
                Card(
                  child: CustomTextFormField(
                    maxLines: 7,
                    hintText: "Give a brief summary about your blog ",
                    onChanged: (p0) {},
                    userTextcontroller: contetFieldController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "write your blog here";
                      }
                      return null;
                    },
                  ),
                ),
                const Text("Reading Minuts"),
                Card(
                  child: CustomTextFormField(
                    maxLines: 1,
                    hintText: "Minutes of reading this blog",
                    onChanged: (p0) {},
                    userTextcontroller: readingMinFieldController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "write your blog here";
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );

                        GetIt.I.get<GetBlog>().update(
                            newBlog: BlogModel(
                                category: blog.category,
                                authorName:
                                    GetIt.I.get<GetBlog>().currentUser.userName,
                                title: titleFieldController.text,
                                summary: summaryFieldController.text,
                                content: contetFieldController.text,
                                date: blog.date,
                                minutesToRead: readingMinFieldController.text,
                                imageSrc: blog.imageSrc,
                                saved: blog.saved),
                            oldBlog: blog);
                        Navigator.pop(context);
                      } else {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Error'),
                            content: const Text('filed the required fields'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: const Text("add"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
