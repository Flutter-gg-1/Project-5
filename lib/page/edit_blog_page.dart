import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_5/data_handle/models/blog_data_model.dart';
import 'package:pro_5/widget/textfield_widget.dart';

class EditBlogPage extends StatefulWidget {
  const EditBlogPage({super.key, required this.blogDataModel});


  final BlogDataModel blogDataModel;

  @override
  State<EditBlogPage> createState() => _EditBlogPageState();
}

class _EditBlogPageState extends State<EditBlogPage> {
  String title ="";

  String summary ="";

  String contnat = "";

  @override
  void initState() {
    

    title = widget.blogDataModel.title;
    summary = widget.blogDataModel.summary;
    contnat = widget.blogDataModel.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

            backgroundColor: const Color(0xff111111),



            appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context,false);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {

              widget.blogDataModel.title = title;
              widget.blogDataModel.summary = summary;
              widget.blogDataModel.content = contnat;

               Navigator.pop(context,true);


            },
            child: const Text(
              "Save",
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
          padding: const EdgeInsets.only(left:  17),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
          
          
            children: [

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
                child: SizedBox(
                  height: 80,
                  child: TextfieldWidget(
                     texLine: 5,
                    onChanged: (val) {
                  
                      title = val;
                        log(title);
                      
                    },
                    intialVal: widget.blogDataModel.title,
                    hint: "Enter your blog title",
                  ),
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
                    onChanged: (val) {

                      summary = val;

                      log(summary);
                      
                    },
                    intialVal: widget.blogDataModel.summary,
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

                    onChanged: (val) {

                      contnat = val;
                        log(contnat);
                      
                    },

                    intialVal: widget.blogDataModel.content,
                    texLine: 10,
                    hint: "write your blog here",
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),




    );
  }
}