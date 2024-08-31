import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pro_5/widget/blog_add_page/category_button_widget.dart';
import 'package:pro_5/widget/textfield_widget.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({super.key});

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  String catgoryValue = "Technology";
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
            onTap: () {},
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
              Container(
                width: 330,
                height: 140,
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8)),
                child: const Icon(
                  FontAwesome.plus_solid,
                  color: Color(0xff979797),
                  size: 42,
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
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: TextfieldWidget(
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
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 100,
                  child: TextfieldWidget(
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
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 200,
                  child: TextfieldWidget(
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
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  child: TextfieldWidget(
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
