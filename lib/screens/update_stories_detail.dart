import 'package:flutter/material.dart';
import 'package:project5/widgets/custom_text/custom_text.dart';
import 'package:project5/widgets/custom_text_form_field.dart';

class UpdateStoriesDetail extends StatelessWidget {
  const UpdateStoriesDetail({super.key});

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
            child: TextButton(onPressed: (){}, child: const CustomText(text: "Save", color: Colors.white, size: 17, fontWeight: FontWeight.bold,))
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Title", color: Colors.white, size: 20, fontWeight: FontWeight.bold,),
              SizedBox(height: 5,),
              CustomTextFormField(hintmsg: "Title"),
              SizedBox(height: 30,),
              CustomText(text: "Summary", color: Colors.white, size: 20, fontWeight: FontWeight.bold,),
              SizedBox(height: 5,),
              CustomTextFormField(hintmsg: "Summary"),
              SizedBox(height: 30,),
              CustomText(text: "Content", color: Colors.white, size: 20, fontWeight: FontWeight.bold,),
              SizedBox(height: 5,),
              CustomTextFormField(hintmsg: "Content"),
            ],
          ),
        ),
      ),
    );
  }
}