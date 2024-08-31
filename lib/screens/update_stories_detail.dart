import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data_layer/blog_data.dart';
import 'package:project5/widgets/custom_text/custom_text.dart';
import 'package:project5/widgets/custom_text_form_field.dart';

class UpdateStoriesDetail extends StatefulWidget {
  UpdateStoriesDetail({super.key, required this.id});
  final int id;
  late TextEditingController titleControoler;
  late TextEditingController summaryControoler;
  late TextEditingController contentControoler;
  @override
  State<UpdateStoriesDetail> createState() => _UpdateStoriesDetailState();
}

class _UpdateStoriesDetailState extends State<UpdateStoriesDetail> {
  @override
  void initState() {
    var selectedBlog = GetIt.I.get<BlogData>().blogData.firstWhere((blog) => blog.id == widget.id);
    widget.titleControoler = TextEditingController(text: selectedBlog.title);
    widget.summaryControoler = TextEditingController(text: selectedBlog.summary);
    widget.contentControoler = TextEditingController(text: selectedBlog.content);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor:  Colors.transparent,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        actions:[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(onPressed: (){
             var selectedBlog = GetIt.I.get<BlogData>().blogData.firstWhere((blog) => blog.id == widget.id);
             selectedBlog.title = widget.titleControoler.text;
             selectedBlog.summary = widget.summaryControoler.text;
             selectedBlog.content = widget.contentControoler.text;
             Navigator.pop(context, true);
            }, child: const CustomText(text: "Save", color: Colors.white, size: 17, fontWeight: FontWeight.bold,))
          ),
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: "Title", color: Colors.white, size: 20, fontWeight: FontWeight.bold,),
              const SizedBox(height: 5,),
              CustomTextFormField(hintmsg: "Title", controller: widget.titleControoler,),
              const SizedBox(height: 30,),
              const CustomText(text: "Summary", color: Colors.white, size: 20, fontWeight: FontWeight.bold,),
              const SizedBox(height: 5,),
              CustomTextFormField(hintmsg: "Summary", controller: widget.summaryControoler,),
              const SizedBox(height: 30,),
              const CustomText(text: "Content", color: Colors.white, size: 20, fontWeight: FontWeight.bold,),
              const SizedBox(height: 5,),
              CustomTextFormField(hintmsg: "Content", controller: widget.contentControoler,),
            ],
          ),
        ),
      ),
    );
  }
}