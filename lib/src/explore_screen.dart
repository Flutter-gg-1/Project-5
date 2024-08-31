import 'package:blog_app/extension/size_config.dart';
import 'package:blog_app/widget/text/custom_text.dart';
import 'package:blog_app/widget/text_feild/custom_feild.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: SafeArea(
        child: Column(
          children: [
            const CustomTextFeild(hintText: '🔍   Search for News', maxLines: 1),
            SizedBox(
              height: context.getHeight() * 0.25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(
                  Iconsax.search_normal_1_outline,
                  color: Colors.white,
                ),
                SizedBox(width: 15,),
                CustomText(text: 'Search for News')
              ],
            )
          ],
        ),
      ),
    );
  }
}
