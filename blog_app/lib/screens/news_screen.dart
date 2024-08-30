import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        actions: const [
          Icon(
            Icons.font_download_outlined,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Icon(
            Icons.bookmark_border,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 20)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 260,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Image (1).png"))),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(FontAwesomeIcons.tencentWeibo,
                      color: Color(0xffBDA6F5), size: 20),
                  SizedBox(width: 5),
                  Text(
                    "Technology",
                    style: TextStyle(fontSize: 14, color: Color(0xffBDA6F5)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                  "Now Google’s Bard AI Chatbot can talk & respond to visual prompts!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 10),
              const CircleAvatar(
                  backgroundImage: AssetImage("assets/Image (1).png")),
              const SizedBox(height: 5),
              const Text(
                "Kyle Barr",
                style: TextStyle(fontSize: 14, color: Color(0xffB8B8B8)),
              ),
              const SizedBox(height: 15),
              const Text(
                "2 min read • Jul 13, 2023",
                style: TextStyle(color: Color(0xffB8B8B8), fontSize: 12),
              ),
              const SizedBox(height: 15),
              const Row(children: [
                SizedBox(width: 5),
                Icon(FontAwesomeIcons.facebookF, color: Colors.white, size: 15),
                SizedBox(width: 10),
                Icon(FontAwesomeIcons.twitter, color: Colors.white, size: 15),
                SizedBox(width: 10),
                Icon(FontAwesomeIcons.link, color: Colors.white, size: 15)
              ]),
              const SizedBox(height: 30),
              const Text("Summary",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 15),
              const Text(
                  "Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300)),
              const SizedBox(height: 30),
              const Text("Content",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 15),
              const Text(
                  "The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard.Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300)),
            ],
          ),
        ),
      ),
    );
  }
}
