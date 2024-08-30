import 'package:flutter/material.dart';
import 'package:project5/widgets/custom_text/custom_text.dart';
import 'package:project5/widgets/custom_text_form_field.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff111111),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 50),
              child: CustomTextFormField(hintmsg: "Search for News", prefixIcon: Icon(Icons.search_rounded, color: Color(0xffB8B8B8),),),
            ),
            Padding(
              padding: EdgeInsets.only(top: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_rounded, color: Color(0xffB8B8B8),),
                  SizedBox(width: 15,),
                  CustomText(text: "Search for a news", color: Color(0xffB8B8B8), size: 20)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}