import 'package:flutter/material.dart';
import 'package:vlog_project/Guest_Screens/guest_home.dart';
import 'package:vlog_project/helper/navigation.dart';

class GuestBlogPage extends StatelessWidget {
  const GuestBlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        leading: IconButton(
          onPressed: () {
            context.push(screen: HomeScreen());
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        actions: const [
          Text(
            "Aa",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(width: 5),
          Icon(
            Icons.bookmark_border,
            color: Colors.white,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligns children to the left
            children: [
              Image.asset(
                "assets/google-big.png",
                width: double.infinity,
                height: 340,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(
                    Icons.line_axis_sharp,
                    color: Color(0XffBDA6F5),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Technology",
                    style: TextStyle(
                      color: Color(0XffBDA6F5),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Now Google’s Bard AI Chatbot can\ntalk & respond to visual prompts!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/profile_page.png"),
                    radius: 24, // Adjust size as needed
                  )
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Kyle Barr",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const Text(
                    "2 min read • Jul 13, 2023",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset("assets/social.png")
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Summary",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  Text(
                    "Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct ",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Content",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  Text(
                    "The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.” Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard. Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
