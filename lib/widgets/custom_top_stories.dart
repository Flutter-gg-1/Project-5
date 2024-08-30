import 'package:flutter/material.dart';

import '../screens/stories_details.dart';
import 'custom_list_tile.dart';
import 'custom_text/custom_text.dart';

class CustomTopStories extends StatelessWidget {
  const CustomTopStories({super.key, this.onTap, required this.image, required this.title, required this.subtitle, required this.text});
  final Function()? onTap;
  final Image image;
  final String title;
  final String subtitle;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 130,
                  width: 450,
                  decoration: BoxDecoration(color: const Color(0xff1E1E1E), borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return const StoriesDetails();
                      }));
                    },
                    child: Column(
                      children: [
                        CustomListTile(image: image, title: title, subtitle: subtitle,),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              CustomText(text: text, color: const Color(0xff888888), size: 10, fontWeight: FontWeight.w500,),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border), padding: const EdgeInsets.only(left: 180),),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                );
  }
}