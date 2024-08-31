import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:project5/widgets/custom_text/custom_text.dart';

import '../update_stories_detail.dart';

class GoogleDetails extends StatelessWidget {
  const GoogleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff1E1E1E),
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        actions: [
          const Icon(
            Icons.text_increase_outlined,
            color: Colors.white,
          ),
          IconButton(onPressed: () { }, icon: const Icon(Icons.bookmark_border,
            color: Colors.white,),              
          ),
          IconButton(onPressed: () { 
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return UpdateStoriesDetail(id: 1,);
            }));
          }, 
          icon: const Icon(Icons.edit_outlined,
            color: Colors.white,),              
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 266,
              width: 470,
              child: Image.asset(
                "assets/google_large.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.pivot_table_chart_outlined,
                        color: Color(0xffBDA6F5),
                      ),
                      Text(
                        "Technology",
                        style:
                            TextStyle(color: Color(0xffBDA6F5), fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomText( text: 
                    "Now Google’s Bard AI Chatbot can talk & respond to visual prompts!",
                        color: Colors.white,
                        size: 20,
                        fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 8,
                  ),
                  Image.asset(
                    "assets/Vector-6.png",
                    width: 28,
                    height: 28,
                  ),
                  const CustomText(text: "Kyle Barr",
                          color: Color(0xffB8B8B8),
                          fontWeight: FontWeight.bold,
                          size: 14),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(text:  "2 min read • Jul 13, 2023",
                          color: Colors.white,
                          size: 12,
                          fontWeight: FontWeight.w500),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      Icon(
                        BoxIcons.bxl_facebook,
                        color: Color(0xffCFCFCF),
                      ),
                      Icon(BoxIcons.bxl_twitter, color: Color(0xffCFCFCF)),
                       Icon(BoxIcons.bx_link, color: Color(0xffCFCFCF)),
                    ],
                  ),
                  const SizedBox(
                    height: 79,
                  ),
                  const CustomText(text:  "Summary",
                          color: Colors.white,
                          size: 16,
                          fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText(text: 
                      "Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct ",
                      color: Color(0xffB8B8B8),
                      size: 14,
                      fontWeight: FontWeight.w500),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomText( text: 
                    "Content",
                        color: Colors.white,
                        size: 16,
                        fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 30,
                  ),
                  const CustomText(text: 
                      "The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”",
                      color: Color(0xffB8B8B8),
                      size: 14,
                      fontWeight: FontWeight.w500)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
