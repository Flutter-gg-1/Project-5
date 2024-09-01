import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:news_feed_app/post_data.dart';
import 'package:news_feed_app/screens/add_post.dart';
import 'package:news_feed_app/widgets/image_scroll.dart';
import 'package:news_feed_app/widgets/post_card.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  
      reBuild() {
      setState(() {});
    }
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPost())
                ).then((value) {
                if (value == true) {
                  reBuild(); // Refresh the page after editing
                }
              });
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
        body: const Center(
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
        children: [
          const ImageScroll(),
          const SizedBox(height: 10),
          const Divider(color: Color.fromARGB(55, 255, 255, 255)),
          const SizedBox(height: 20),
          const Row(
            children: [
              Text(
                'Top Stories',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xffffffff)),
              ),
              Spacer(),
              Text(
                'See all',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff888888)),
              ),
            ],
          ),
          const SizedBox(height: 10), 
          Column(
            children: GetIt.I.get<PostData>().postsList
                .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: StoryCard(
                        id: e.id,
                        title: e.title,
                        username: e.author,
                        imgPath: e.image,
                        dateAndTime: e.minutes,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}