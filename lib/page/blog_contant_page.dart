import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pro_5/data_handle/git_it/setup.dart';
import 'package:pro_5/data_handle/models/app_model.dart';
import 'package:pro_5/data_handle/models/blog_data_model.dart';
import 'package:pro_5/data_handle/models/user_model.dart';
import 'package:pro_5/page/edit_blog_page.dart';
import 'package:pro_5/widget/blog_conatan_page/bold_title_widget.dart';
import 'package:pro_5/widget/blog_conatan_page/socail_midea_icons.dart';
import 'package:pro_5/widget/blog_conatan_page/text_blog_widget.dart';

class BlogContantPage extends StatefulWidget {
  const BlogContantPage({super.key, required this.blogDataModel});


  final BlogDataModel  blogDataModel;
  

  @override
  State<BlogContantPage> createState() => _BlogContantPageState();
}

class _BlogContantPageState extends State<BlogContantPage> {

  UserModel user =  getIt.get<AppModel>().userLogin!;


  @override
  void initState() {
    log(user.id.toString());
    // log(widget.blogDataModel.userId.toString());
    super.initState();
  }
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
            Navigator.pop(context,true);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Text(
              "Aa",
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_outline,
              color: Colors.white,
            ),
          ),
            user.id == widget.blogDataModel.userId ? IconButton(
            onPressed: () {

              Navigator.of(context).push(MaterialPageRoute(builder: (context) {


                return   EditBlogPage(blogDataModel: widget.blogDataModel,)  ;
                
              },)).then((onValue){
                if(onValue == true){
                  setState(() {
                    
                  });
                }
              });
            },
            icon: const Icon(
              FontAwesome.pencil_solid,
              color: Colors.white,
            ),
          ) : const Text("data")
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.blogDataModel.img,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.science_outlined,
                    color: Color(0xffBDA6F5),
                  ),
                  Text(
                    widget.blogDataModel.category,
                    style: GoogleFonts.inter(
                        color: const Color(0xffBDA6F5),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                widget.blogDataModel.title,
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset("asset/img/Vector (5).png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                widget.blogDataModel.userName,
                style: GoogleFonts.inter(
                    color: const Color(0xffB8B8B8), fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "${widget.blogDataModel.readingMin} • ${widget.blogDataModel.date}",
                style: GoogleFonts.inter(
                    color: const Color(0xffB8B8B8), fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SocailMideaIcons(),
            const SizedBox(
              height: 40,
            ),
            const BoldTitleWidget(text: "Summary",),
            const SizedBox(
              height: 15,
            ),
             TextBlogWidget(text: widget.blogDataModel.summary,),

            const SizedBox(
              height: 38,
            ),

            const BoldTitleWidget( text: "Content",),

            const SizedBox(height: 15,),

            TextBlogWidget(text: widget.blogDataModel.content,)


           , const SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}




