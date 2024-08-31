import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_feed_app/screens/blog.dart';

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
              onPressed: () {},
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
              Padding(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageScroll extends StatelessWidget {
  const ImageScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 343,
      height: 180,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xffffffff),
      ),
      child: Image.asset('assets/images/google.png', fit: BoxFit.cover),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({super.key, required this.title, required this.username, required this.imgPath, required this.dateAndTime});
  final String title;
  final String username;
  final String imgPath;
  final String dateAndTime;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xff1E1E1E),
        ),
        child: InkWell(
           onTap: () {
             Navigator.push(context,  MaterialPageRoute(builder: (context) => const BlogPage()));
           },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // Aligns items at the top
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      width: 80,
                      height: 62,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Color(0xffffffff),
                      ),
                      child: Image.asset(imgPath, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 8),
                     Expanded( 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          Text(
                            username,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff888888)),
                          ),
                          Text(
                            title,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
                            maxLines: 2, 
                            overflow: TextOverflow.ellipsis, 
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Text(
                      dateAndTime,
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xff888888)),
                    ),
                    const Spacer(),
                    const Row(
                      children: [
                        Icon(Icons.bookmark_border, color: Color(0xff888888),),
                        Icon(Icons.more_vert, color: Color(0xff888888),),
                      ],
                    )        
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}