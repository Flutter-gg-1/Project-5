import 'package:flutter/material.dart';
import 'package:project_5/components/pageview/pageview_custom.dart';
import 'package:project_5/components/stories/stories.dart';
import 'package:project_5/components/text/text_custom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xff111111),
        appBar: AppBar(
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color(0xffDD403C),
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xff888888),
            tabs: [
              Tab(
                text: "Tech",
              ),
              Tab(
                text: "AI",
              ),
              Tab(
                text: "Cloud",
              ),
              Tab(
                text: "Robotics",
              ),
              Tab(
                text: "IoT",
              ),
            ],
          ),
          leading: const Icon(
            Icons.list_sharp,
            color: Colors.white,
          ),
          backgroundColor: const Color(0xff1e1e1e),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  width: 343,
                  height: 180,
                  child: PageView(children: const [
                    PageviewCustom(),
                    PageviewCustom(),
                    PageviewCustom(),
                  ]),
                ),
                const Divider(
                  color: Color(0x20FFFFFF),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                        text: "Top Stories",
                        color: Color(0xffE8E8E8),
                        weight: FontWeight.w700,
                        fontSize: 16),
                    TextCustom(
                        text: "See all",
                        color: Color(0xff888888),
                        weight: FontWeight.w600,
                        fontSize: 12)
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Stories(
                    imagePath: "assets/STK156_Instagram_threads_2 2.png",
                    title: "Kyle Barr",
                    subtitle:
                        "Now Google’s Bard AI can talk & respond to visual prompts",
                    date: "Jul 13, 2023 ",
                    readTime: "2 min read"),
                const SizedBox(
                  height: 12,
                ),
                const Stories(
                    imagePath: "assets/STK156_Instagram_threads_2 2 (1).png",
                    title: "Jeremy Morgan",
                    subtitle: "WatchOS 10 preview: widgets all the way down",
                    date: "Jul 10, 2023",
                    readTime: "4 min read"),
                const SizedBox(
                  height: 12,
                ),
                const Stories(
                    imagePath: "assets/STK156_Instagram_threads_2 22.png",
                    title: "Amber Israelsen",
                    subtitle:
                        "How Gen Z are disrupting the definition of ‘prestigious’ jobs",
                    date: "Jul 10, 2023",
                    readTime: "5 min read")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
