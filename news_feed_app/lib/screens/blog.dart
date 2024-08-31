import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_feed_app/screens/edit_post.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white), 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(0, 33, 149, 243),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/svg/language.svg'), 
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.white),
            onPressed: () {},
          ),
           IconButton(
            icon: const Icon(Icons.create_outlined , color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EditPost()));
            },
          ),
        ],
      ),
      body: const Post()
    );
  }
}

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          SizedBox(
            width: 375,
            height: 240,
            child: Image.asset('assets/images/google.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svg/Technology.svg'),
                    const SizedBox(width: 5,),
                    const Text(
                    'TECHNOLOGY',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffBDA6F5),
                    ),
                  ),
                  ],
                ),
                const SizedBox(height: 10,),
                const Text(
                    'Now Google’s Bard AI can talk & respond to visual prompts',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis, 
                  ),
                const SizedBox(height: 10,),
                Container(
                  width: 30,
                  height: 30,
                    decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    shape: BoxShape.circle,
                  ),
                ),
                 const SizedBox(height: 8,),
                const Text(
                  'username',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xffB8B8B8)),
                ),
                const SizedBox(height: 15,),
                const Text(
                  '2 min read • Jul 13, 2023',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff888888)),
                ),
                const SizedBox(height: 15,),
                SvgPicture.asset('assets/svg/socials.svg'), 
                const SizedBox(height: 40,),
                const Text(
                    'Summary',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis, 
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                  'Google is adding some new features to its Bard AI chatbot, including the ability for Bard to speak its answers to you and for it to respond to prompts that also include images. The chatbot is also now available in much of the world, including the EU. In a blog post, Google is positioning Bard’s spoken responses as a helpful way to “correct ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xffB8B8B8)),
                ),
                const SizedBox(height: 40,),
                const Text(
                    'Content',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
                    maxLines: 2, 
                    overflow: TextOverflow.ellipsis, 
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    'The feature that lets you add images to prompts is something that Google first showed off at its I/O conference in May. In one example, Google suggested you could use this to ask for help writing a funny caption about a picture of two dogs. Google says the feature is now available in English and is expanding to new languages “soon.” Google is introducing a few other new features, too, including the ability to pin and rename conversations, share responses with your friends, and change the tone and style of the responses you get back from Bard. Google first opened up access to Bard in March, but at the time, it was available only in the US and the UK. The company has been rolling out the chatbot to many more countries since then, and that now includes “all countries in the EEA [European Economic Area] and Brazil,” Google spokesperson Jennifer Rodstrom tells The Verge. That expansion in Europe is a notable milestone; the company’s planned Bard launch in the EU was delayed due to privacy c',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xffB8B8B8)),
                ),
              ],
            )
          ),
        ],
      );
  }
}