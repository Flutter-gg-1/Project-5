import 'package:flutter/material.dart';
import 'custom_list_tile.dart';
import 'custom_text/custom_text.dart';

class CustomTopStories extends StatefulWidget {
  const CustomTopStories({super.key, this.onTap, required this.image, required this.title, required this.subtitle, required this.text,});
  final Function()? onTap;
  final Image image;
  final String title;
  final String subtitle;
  final String text;

  @override
  State<CustomTopStories> createState() => _CustomTopStoriesState();
}

class _CustomTopStoriesState extends State<CustomTopStories> {
  late bool isSave = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
                  height: 130,
                  width: 450,
                  decoration: BoxDecoration(color: const Color(0xff1E1E1E), borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    onTap: widget.onTap,
                    child: Column(
                      children: [
                        CustomListTile(image: widget.image, title: widget.title, subtitle: widget.subtitle,),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              CustomText(text: widget.text, color: const Color(0xff888888), size: 10, fontWeight: FontWeight.w500,),
                              IconButton(onPressed: (){
                                if(isSave == true){

                                }
                                setState(() {
                                  isSave = !isSave;
                                });
                              }, icon:  Icon(isSave ? Icons.bookmark : Icons.bookmark_border, color: isSave ? Colors.white : Color(0xff888888),)  , padding: const EdgeInsets.only(left: 80),),
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