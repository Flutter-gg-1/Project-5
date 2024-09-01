import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/data_layer/blog_data.dart';
import 'custom_list_tile.dart';
import 'custom_text/custom_text.dart';

class CustomTopStories extends StatelessWidget {
  CustomTopStories({super.key, this.onTap, required this.image, required this.title, required this.subtitle, required this.text, required this.id, required this.isSave, this.onPressed,});
  final Function()? onTap;
  final Image image;
  final String title;
  final String subtitle;
  final String text;
  final int id;
  final bool isSave;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
                  height: 130,
                  width: 450,
                  decoration: BoxDecoration(color: const Color(0xff1E1E1E), borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: onTap,
                    child: Column(
                      children: [
                        CustomListTile(image: image, title: title, subtitle: subtitle,),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              CustomText(text: text, color: const Color(0xff888888), size: 10, fontWeight: FontWeight.w500,),
                              IconButton(onPressed: onPressed, icon:  Icon(isSave ? Icons.bookmark : Icons.bookmark_border, color: isSave ? Colors.white : Color(0xff888888),)  , padding: const EdgeInsets.only(left: 80),),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined, color: Color(0xff888888),))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                );
  }
}