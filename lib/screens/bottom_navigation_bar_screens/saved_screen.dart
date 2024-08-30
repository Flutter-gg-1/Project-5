import 'package:flutter/material.dart';

import '../../widgets/custom_text/custom_text.dart';
import '../../widgets/custom_text_form_field.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff111111),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: CustomText(text: "Saved News", color: Colors.white, size: 20, fontWeight: FontWeight.bold,),
            ),
            Padding(
              padding: EdgeInsets.only(top: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: "No news found", color: Color(0xffB8B8B8), size: 20)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}