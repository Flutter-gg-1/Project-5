import 'package:blog_app/data_layer/get_blog.dart';
import 'package:blog_app/helper/screen.dart';
import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/widget/button/textfield/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final formKey = GlobalKey<FormState>();
  List<String> categories = ["technology", "ai", "cloud", "robotic", "iot"];
  TextEditingController titleFieldController = TextEditingController();
  TextEditingController summaryFieldController = TextEditingController();

  TextEditingController contetFieldController = TextEditingController();

  TextEditingController readingMinFieldController = TextEditingController();

  int? value = 0;
  String imageSrc = "";
  @override
  Widget build(BuildContext context) {
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
                const Text("Image"),
                InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    imageSrc = image!.path;
                  },
                  child: SizedBox(
                    height: context.getHight(value: .2),
                    child: const Card(
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                ),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: categories.map((category) {
                    return Container(
                      margin: const EdgeInsets.all(19),
                      child: ChoiceChip(
                        checkmarkColor: Colors.red,
                        label: Text(category),
                        onSelected: (bool selected) {
                          value =
                              selected ? categories.indexOf(category) : null;
                          setState(() {});
                        },
                        selected: value == categories.indexOf(category),
                      ),
                    );
                  }).toList()),
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

                        GetIt.I.get<GetBlog>().addblog(BlogModel(
                            category: categories[value!],
                            authorName:
                                GetIt.I.get<GetBlog>().currentUser.userName,
                            title: titleFieldController.text,
                            summary: summaryFieldController.text,
                            content: contetFieldController.text,
                            date: "date",
                            minutesToRead: readingMinFieldController.text,
                            imageSrc: imageSrc,
                            saved: false));
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
