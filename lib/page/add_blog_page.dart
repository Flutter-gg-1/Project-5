import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pro_5/data_handle/git_it/setup.dart';
import 'package:pro_5/data_handle/models/app_model.dart';
import 'package:pro_5/data_handle/models/blog_data_model.dart';
import 'package:pro_5/helper/date_format.dart';
import 'package:pro_5/widget/blog_add_page/category_button_widget.dart';
import 'package:pro_5/widget/textfield_widget.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({super.key});

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  String catgoryValue = "Technology";
  String title = "";
  String summary = "";
  String contnat = "";
  String readMin = "";

  String? img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
             
             


               getIt.get<AppModel>().addToList( BlogDataModel(
                userId: getIt.get<AppModel>().userLogin!.id ,
                  title: title,
                  category: catgoryValue,
                  content: contnat,
                  readingMin: "${readMin} min read",
                  userName: getIt.get<AppModel>().userLogin!.name,
                  summary: summary,
                  img: "asset/img/Image.png",
                  date: dateFormat()));


                  // getIt.get<AppModel>().userLogin!.doneBlog.add(getIt.get<AppModel>().blogList.last.id);

                  // getIt.get<AppModel>().addDone();

                  

              Navigator.pop(context, true);
            },
            child: const Text(
              "Post",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "Image",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  final imagePicker = ImagePicker();
                  final pickedFile =
                      await imagePicker.pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    img = pickedFile.path;
                    setState(() {});
                  }
                },
                child: Container(
                  width: 330,
                  height: 140,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8)),
                  child: img == null
                      ? const Icon(
                          FontAwesome.plus_solid,
                          color: Color(0xff979797),
                          size: 42,
                        )
                      : Image.file(
                          File(img!),
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Title",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: TextfieldWidget(
                  onChanged: (p0) {
                    title = p0;
                  },
                  hint: "Enter your blog title",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Summary",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 100,
                  child: TextfieldWidget(
                    onChanged: (p0) {
                      summary = p0;
                    },
                    texLine: 10,
                    hint: "Give a brief summary about your blog ",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Content",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 200,
                  child: TextfieldWidget(
                    onChanged: (p0) {
                      contnat = p0;
                    },
                    texLine: 10,
                    hint: "write your blog here",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Category",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryButtonWidget(
                    tex: "Technology",
                    isSlected: catgoryValue == "Technology",
                    onTap: () {
                      catgoryValue = "Technology";

                      setState(() {
                        log(catgoryValue);
                      });
                    },
                  ),
                  CategoryButtonWidget(
                    tex: "AI",
                    isSlected: catgoryValue == "AI",
                    onTap: () {
                      catgoryValue = "AI";

                      setState(() {
                        log(catgoryValue);
                      });
                    },
                  ),
                  CategoryButtonWidget(
                    tex: "Cloud",
                    isSlected: catgoryValue == "Cloud",
                    onTap: () {
                      catgoryValue = "Cloud";

                      setState(() {
                        log(catgoryValue);
                      });
                    },
                  ),
                  CategoryButtonWidget(
                    tex: "Robotic",
                    isSlected: catgoryValue == "Robotic",
                    onTap: () {
                      catgoryValue = "Robotic";

                      setState(() {
                        log(catgoryValue);
                      });
                    },
                  ),
                  CategoryButtonWidget(
                    tex: "IoT",
                    isSlected: catgoryValue == "IoT",
                    onTap: () {
                      catgoryValue = "IoT";

                      setState(() {
                        log(catgoryValue);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Reading minutes",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  child: TextfieldWidget(
                    onChanged: (p0) {
                      readMin = p0;
                    },
                    texLine: 10,
                    hint: "Minutes of reading this blog",
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
