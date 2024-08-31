import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_feed_app/screens/add_post.dart';
import 'package:news_feed_app/widgets/image_scroll.dart';
import 'package:news_feed_app/widgets/post_card.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xff111111),
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset('assets/svg/menu.svg'),
            onPressed: () {},
          ),
          backgroundColor: const Color(0xff1E1E1E), 
          actions: [
            IconButton(
              icon:  SvgPicture.asset('assets/svg/search.svg'),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPost()));
              },
            ),
          ],
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color(0xffDD403C),
            unselectedLabelStyle: TextStyle(color: Color(0xff888888)),
            labelStyle: TextStyle(fontSize: 16, color: Color(0xffffffff), fontWeight: FontWeight.w600),
            tabs: [
              Tab(text: 'Tech'),
              Tab(text: 'AI'),
              Tab(text: 'Cloud'),
              Tab(text: 'Robotics'),
              Tab(text: 'IoT'),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            children: [
              TechFeed(),
              TechFeed(),
              TechFeed(),
              TechFeed(),
              TechFeed(),
            ],
          ),
        ),
      ),
    );
  }
}

class TechFeed extends StatelessWidget {
  const TechFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(15),
                child: ListView(
                  children: const [
                    ImageScroll(),
                    SizedBox(height: 10,),
                    Divider(color:  Color.fromARGB(55, 255, 255, 255),),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text('Top Stories', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700 ,color: Color(0xfffffffff)),),
                        Spacer(),
                        Text('See all', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600 ,color: Color(0xff888888)),),
                      ],
                    ),
                    SizedBox(height: 20,),
                    StoryCard( title: 'Now Google’s Bard AI can talk & respond to visual prompts', username: 'Kyle Barr', imgPath: 'assets/images/google.png', dateAndTime: 'Jul 13, 2023 • 2 min read', ),
                    SizedBox(height: 10,),
                    StoryCard( title: 'Now Google’s Bard AI can talk & respond to visual prompts', username: 'Kyle Barr', imgPath: 'assets/images/google.png', dateAndTime: 'Jul 13, 2023 • 2 min read', ),
                    SizedBox(height: 10,),
                    StoryCard( title: 'Now Google’s Bard AI can talk & respond to visual prompts', username: 'Kyle Barr', imgPath: 'assets/images/google.png', dateAndTime: 'Jul 13, 2023 • 2 min read', ),
                  ],
                ),
              );
  }
}