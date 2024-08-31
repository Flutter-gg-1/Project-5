import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project5/model/blog_data_model.dart';

import '../data_layer/blog_data.dart';
import '../widgets/custom_text/custom_text.dart';
import '../widgets/custom_text/custom_text_rich.dart';
import '../widgets/custom_text_form_field.dart';

class AddBlogPost extends StatefulWidget {
  const AddBlogPost({super.key});

  @override
  State<AddBlogPost> createState() => _AddBlogPostState();
}

class _AddBlogPostState extends State<AddBlogPost> {
  TextEditingController imageController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController readingMinutesController = TextEditingController();
  File? selectimage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                  onPressed: () async {
                    if (selectimage != null) {
                      String image =
                          base64Encode(await selectimage!.readAsBytes());
                      GetIt.I.get<BlogData>().addBlogPost(
                          blog: BlogDataModel(
                              category: "AI",
                              authorName: "aaa",
                              title: titleController.text,
                              summary: summaryController.text,
                              content: contentController.text,
                              date: DateTime.now(),
                              minutesToRead:
                                  int.tryParse(readingMinutesController.text) ??
                                      0,
                              postImage: image,
                              id: Random().nextInt(99999),
                              isSaved: false));
                      Navigator.pop(context, true);
                    }
                  },
                  child: const CustomText(
                    text: "Post",
                    color: Colors.white,
                    size: 17,
                    fontWeight: FontWeight.bold,
                  ))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: "Image",
                color: Colors.white,
                size: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 140,
                width: 400,
                child: ElevatedButton(
                    onPressed: () async {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        setState(() {
                          selectimage = File(image.path);
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xffFFFFFF).withOpacity(0.12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.zero),
                    child: selectimage != null
                        ? Image.file(
                            File(selectimage!.path),
                            height: 140,
                            width: 400,
                            fit: BoxFit.fill,
                          )
                        : const Icon(
                            Icons.add_rounded,
                            color: Color(0xffB8B8B8),
                            size: 60,
                          )),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomTextRich(
                text: 'Title',
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                  hintmsg: "Enter your blog title",
                  controller: titleController),
              const SizedBox(
                height: 30,
              ),
              const CustomTextRich(
                text: 'Summary',
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                hintmsg: "Give a brief summary about your blog ",
                controller: summaryController,
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomTextRich(
                text: 'Content',
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                hintmsg: "write your blog here ",
                controller: contentController,
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomTextRich(
                text: 'Category',
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(2)),
                        child: const Center(
                          child: CustomText(
                            text: "Technology",
                            color: Color(0xffA48BE2),
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xff595959),
                            borderRadius: BorderRadius.circular(2)),
                        child: const Center(
                          child: CustomText(
                            text: "AI",
                            color: Color(0xff2C2C2C),
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            color: const Color(0xff595959),
                            borderRadius: BorderRadius.circular(2)),
                        child: const Center(
                          child: CustomText(
                            text: "Cloud",
                            color: Color(0xff2C2C2C),
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          color: const Color(0xff595959),
                          borderRadius: BorderRadius.circular(2)),
                      child: const Center(
                        child: CustomText(
                          text: "Robotic",
                          color: Color(0xff2C2C2C),
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xff595959),
                          borderRadius: BorderRadius.circular(2)),
                      child: const Center(
                        child: CustomText(
                          text: "IoT",
                          color: Color(0xff2C2C2C),
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomTextRich(
                text: 'Reading minutes',
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                hintmsg: "Minutes of reading this blog ",
                controller: readingMinutesController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
