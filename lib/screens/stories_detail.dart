import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:project5/data_layer/blog_data.dart';
import 'package:project5/data_layer/user_data.dart';

import '../widgets/custom_text/custom_text.dart';
import 'update_stories_detail.dart';

class StoriesDetail extends StatefulWidget {
  const StoriesDetail({super.key, required this.id});
  final int id;

  @override
  State<StoriesDetail> createState() => _StoriesDetailState();
}

class _StoriesDetailState extends State<StoriesDetail> {
  bool isSave = false;
  var isLogin = GetIt.I.get<UserData>().isLogedIn();
  @override
  Widget build(BuildContext context) {
    var selectedBlog = GetIt.I.get<BlogData>().blogData.firstWhere((blog) => blog.id == widget.id);
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        leading: IconButton(onPressed: () { 
          Navigator.pop(context);
         }, icon: Icon(Icons.arrow_back_ios_new, color: Colors.white,),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.text_increase_outlined,
              color: Colors.white,
            ),
          ),
          isLogin? IconButton(onPressed: () { 
            isSave = true;
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return UpdateStoriesDetail(id: selectedBlog.id);
            })).then((value) =>{
              if(value != null){
                setState(() {
                })
              }
            });
          }, icon: const Icon(Icons.edit_outlined,
            color: Colors.white,),              
          ) : SizedBox.shrink(),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
          ),
          isSave ? TextButton(onPressed: (){
            Navigator.pop(context, true);
            setState(() {
              isSave = false;
            });
          }, child: const Text("Save", style: TextStyle(color: Colors.white),)) : const SizedBox.shrink()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 266,
              width: 470,
              child: Image.asset(
                "assets/google_large.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.pivot_table_chart_outlined,
                        color: Color(0xffBDA6F5),
                      ),
                      Text(
                        "Technology",
                        style:
                            TextStyle(color: Color(0xffBDA6F5), fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomText( text: 
                    selectedBlog.title,
                        color: Colors.white,
                        size: 20,
                        fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 8,
                  ),
                  Image.asset(
                    "assets/Vector-6.png",
                    width: 28,
                    height: 28,
                  ),
                  CustomText(text: selectedBlog.authorName,
                          color: const Color(0xffB8B8B8),
                          fontWeight: FontWeight.bold,
                          size: 14),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(text:  "${selectedBlog.date} . ${selectedBlog.minutesToRead}",
                          color: Colors.white,
                          size: 12,
                          fontWeight: FontWeight.w500),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      Icon(
                        BoxIcons.bxl_facebook,
                        color: Color(0xffCFCFCF),
                      ),
                      Icon(BoxIcons.bxl_twitter, color: Color(0xffCFCFCF)),
                       Icon(BoxIcons.bx_link, color: Color(0xffCFCFCF)),
                    ],
                  ),
                  const SizedBox(
                    height: 79,
                  ),
                  const CustomText(text:  "Summary",
                          color: Colors.white,
                          size: 16,
                          fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 20,
                  ),
                   CustomText(text: 
                      selectedBlog.summary,
                      color: const Color(0xffB8B8B8),
                      size: 14,
                      fontWeight: FontWeight.w500),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText( text: 
                    "Content",
                        color: Colors.white,
                        size: 16,
                        fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomText(text: 
                      selectedBlog.content,
                      color: const Color(0xffB8B8B8),
                      size: 14,
                      fontWeight: FontWeight.w500)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}