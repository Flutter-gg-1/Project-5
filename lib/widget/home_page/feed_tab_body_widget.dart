import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_5/data_handle/models/blog_data_model.dart';
import 'package:pro_5/widget/home_page/blog_card_widget.dart';
import 'package:pro_5/widget/home_page/blog_slider_widget.dart';

class FeedTabBodyWidget extends StatelessWidget {
  const FeedTabBodyWidget({
    super.key,
    required this.blogList,
  });

  final List<BlogDataModel> blogList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(child: BlogSliderWidget()),
          const SizedBox(
            height: 10,
          ),
          Divider(
            endIndent: 16,
            indent: 16,
            color: const Color(0xffFFFFFF).withOpacity(0.1),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Top Stories",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Text(
                  "See all",
                  style: GoogleFonts.inter(
                      color: const Color(0xff888888),
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ],
            ),
          ),
          
    
        Column(
    
          children: blogList.map((e) {
    
            return  BlogCardWidget(blogDataModel: e,);
            
          },).toList(),
        )
        ],
      ),
    );
  }
}
