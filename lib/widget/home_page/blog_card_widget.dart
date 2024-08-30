import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_5/page/blog_contant_page.dart';

class BlogCardWidget extends StatelessWidget {
  const BlogCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {


          return const BlogContantPage();
          

        },));
      },
      child: Container(
        width: 340,
        height: 108,
        decoration: BoxDecoration(
            color: const Color(0xff1E1E1E),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Row(
                children: [
                  Image.asset(
                    "asset/img/STK156_Instagram_threads_2 2.png",
                    width: 80,
                    height: 62,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kyle Barr",
                          style: GoogleFonts.inter(
                              color: const Color(0xff888888),
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                      SizedBox(
                        width: 240,
                        child: Text(
                          "Now Google’s Bard AI can talk & respond to visual prompts",
                          style: GoogleFonts.inter(
                              color: const Color(0xffE8E8E8),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    "Jul 13, 2023 • 2 min read",
                    style: GoogleFonts.inter(
                        color: const Color(0xff888888),
                        fontWeight: FontWeight.bold,
                        fontSize: 11),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Icon(
                    Icons.bookmark_outline,
                    color: Color(0xff888888),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Color(0xff888888),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
