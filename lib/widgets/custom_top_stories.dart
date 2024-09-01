import 'package:flutter/material.dart';
import 'custom_lists/custom_list_tile.dart';
import 'custom_text/custom_text.dart';

class CustomTopStories extends StatelessWidget {
  const CustomTopStories({super.key, this.onTap, required this.image, required this.title, required this.subtitle, required this.text, required this.id, required this.isSave, this.onPressed,});
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
      margin: const EdgeInsets.only(top: 12),
                  height: 160,
                  width: 450,
                  decoration: BoxDecoration(color: const Color(0xff1E1E1E), borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: onTap,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomListTile(image: image, title: title, subtitle: subtitle,),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: text, color: const Color(0xff888888), size: 10, fontWeight: FontWeight.w500,),
                              Row(
                                children: [
                                  IconButton(onPressed: onPressed, icon:  Icon(isSave ? Icons.bookmark : Icons.bookmark_border, color: isSave ? Colors.white : const Color(0xff888888),)  , padding: const EdgeInsets.only(left: 80),),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined, color: Color(0xff888888),))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                );
  }
}