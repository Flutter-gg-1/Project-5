import 'package:blog_app_project/helper/extensions/screen.dart';
import 'package:blog_app_project/screens/update_blog_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff111111),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.font,
              color: Color(0xff888888),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.bookmark,
              color: Color(0xff888888),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const UpdateBlogScreen();
              }));
            },
            icon: const FaIcon(
              FontAwesomeIcons.pencil,
              color: Color(0xff888888),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                'assets/Image.png',
                width: context.getWidth(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.account_box,
                        color: Color(0xffBDA6F5),
                      ),
                      Text(
                        'Technology',
                        style: TextStyle(
                            color: Color(0xffBDA6F5),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Inter'),
                      )
                    ],
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: context.getWidth()),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Now Google\'s Bard AI Chatbot can talk & respond to visual prompts!',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                fontFamily: 'Inter'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset('assets/Vector(2).png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Kyle Barr',
                        style: TextStyle(
                            color: Color(0xffB8B8B8),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'Inter'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    children: [
                      Text(
                        '2 min read • Jul 13, 2023',
                        style: TextStyle(
                            color: Color(0xff888888),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: 'Inter'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.facebookF,
                        color: Color(0xff888888),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Color(0xff888888),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FaIcon(
                        FontAwesomeIcons.link,
                        color: Color(0xff888888),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Summary',
                        style: TextStyle(
                            color: Color(0xffE8E8E8),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: 'Inter'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU.In a blog post, Google is positioning Bard\'s spoken responses as a helpful way to “correct',
                          style: TextStyle(
                              color: Color(0xff888888),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: 'Inter'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Content',
                        style: TextStyle(
                            color: Color(0xffE8E8E8),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: 'Inter'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.”Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard. Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy concerns.',
                          style: TextStyle(
                              color: Color(0xff888888),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: 'Inter'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
