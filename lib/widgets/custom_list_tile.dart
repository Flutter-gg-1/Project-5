import 'package:flutter/material.dart';

import 'custom_text/custom_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.image, required this.title, required this.subtitle});
  final ImageProvider image;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
                          leading: Image(image: image),
                          title:  CustomText(text: title, color: Color(0xffB8B8B8), size: 12, fontWeight: FontWeight.w500,),
                          subtitle: CustomText(text:  subtitle, color: Colors.white, size: 16, fontWeight: FontWeight.w700,));
  }
}