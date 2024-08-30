import 'package:flutter/material.dart';
import 'package:project5/widgets/custom_text/custom_text.dart';
import 'package:project5/widgets/custom_text_form_field.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom:const PreferredSize(preferredSize: Size.fromHeight(30), child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: CustomTextFormField(hintmsg: "Search for News", prefixIcon: Icon(Icons.search_rounded, color: Color(0xffB8B8B8),),),
        )) ,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search_rounded, color: Color(0xffB8B8B8),),
              SizedBox(width: 15,),
              CustomText(text: "Search for a news", color: Color(0xffB8B8B8), size: 20)
            ],
          )
        ],
      ),
    );
  }
}