import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pro_5/widget/blog_conatan_page/bold_title_widget.dart';
import 'package:pro_5/widget/blog_conatan_page/socail_midea_icons.dart';
import 'package:pro_5/widget/blog_conatan_page/text_blog_widget.dart';

class BlogContantPage extends StatelessWidget {
  const BlogContantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Text(
              "Aa",
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_outline,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesome.pencil_solid,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "asset/img/Image.png",
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.science_outlined,
                    color: Color(0xffBDA6F5),
                  ),
                  Text(
                    "Technology",
                    style: GoogleFonts.inter(
                        color: const Color(0xffBDA6F5),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Now Google’s Bard AI Chatbot can talk & respond to visual prompts!",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset("asset/img/Vector (5).png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Kyle Barr",
                style: GoogleFonts.inter(
                    color: const Color(0xffB8B8B8), fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "2 min read • Jul 13, 2023",
                style: GoogleFonts.inter(
                    color: const Color(0xffB8B8B8), fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SocailMideaIcons(),
            const SizedBox(
              height: 40,
            ),
            const BoldTitleWidget(text: "Summary",),
            const SizedBox(
              height: 15,
            ),
            const TextBlogWidget(text: "Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.",),

            const SizedBox(
              height: 38,
            ),

            BoldTitleWidget( text: "Content",),

            SizedBox(height: 15,),

            TextBlogWidget(text: "The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”",)


           , const SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}




