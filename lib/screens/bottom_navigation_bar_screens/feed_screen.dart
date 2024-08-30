import 'package:flutter/material.dart';
import 'package:project5/widgets/custom_text/custom_text.dart';
import 'package:project5/widgets/custom_top_stories.dart';

import '../stories_details/google_details.dart';
import '../stories_details/job_details.dart';
import '../stories_details/watchOS_details.dart';


class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xff111111),
        appBar: AppBar(
          leading: const Icon(Icons.menu, color: Color(0xffffffff), size: 28,),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Color(0xffffffff), size: 28,),
            )
          ],
          backgroundColor: const Color(0xff1E1E1E),
          bottom: const TabBar(tabs: [
            Text("Tech"),
            Text("AI"),
            Text("Cloud"),
            Text("Robotics"),
            Text("IoT"),
          ],
          indicatorColor: Color(0xffDD403C),
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelStyle: TextStyle(color: Color(0xff888888)),
          labelStyle: TextStyle(color: Colors.white, fontSize: 16),
          labelPadding: EdgeInsets.all(4),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 180,
                    width: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        PageView(
                          children: [
                            Image.asset("assets/STK156_Instagram_threads_2 1.png", fit: BoxFit.fill,),
                            Image.asset("assets/STK156_Instagram_threads_2 1.png", fit: BoxFit.fill,),
                            Image.asset("assets/STK156_Instagram_threads_2 1.png", fit: BoxFit.fill,),
                          ],
                        ),
                        const Positioned(
                          top: 130,
                          left: 20,
                          child: CustomText(text:  "DJI • Jul 10, 2023", color: Color(0xffB8B8B8), size: 10, fontWeight: FontWeight.w500,)),
                          const Positioned(
                          top: 150,
                          left: 20,
                          child: CustomText(text:  "A month with DJI Mini 3 Pro", color: Colors.white, size: 16, fontWeight: FontWeight.bold)),
                          const Positioned(
                          top: 140,
                          left: 360,
                          child: Icon(Icons.arrow_outward_outlined, color: Colors.white,)),
                      ],
                    ),
                  ),
                  Divider(color: const Color(0xffFFFFFF).withOpacity(0.1),),
                  const SizedBox(height: 12,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "Top Stories", color: Colors.white, size: 16, fontWeight: FontWeight.bold,),
                      CustomText(text: "See all", color: Color(0xff888888), size: 12, fontWeight: FontWeight.w700,),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  CustomTopStories(image: Image.asset("assets/google_small.png"), title: 'Kyle Barr', subtitle: 'Now Google’s Bard AI can talk & respond to visual prompts', text: "Jul 13, 2023 • 2 min read", onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return const GoogleDetails();
                      }));
                  },),
                  const SizedBox(height: 12,),
                  CustomTopStories(image: Image.asset("assets/watch.png"), title: 'Jeremy Morgan', subtitle: 'WatchOS 10 preview: widgets all the way down', text: "Jul 10, 2023 • 4 min read", onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return const WatchosDetails();
                      }));
                  },),
                  const SizedBox(height: 12,),
                  CustomTopStories(image: Image.asset("assets/job.png"), title: 'Amber Israelsen', subtitle: 'How Gen Z are disrupting the definition of ‘prestigious’ jobs', text: "Jul 13, 2023 • 2 min read", onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return const JobDetails();
                      }));
                  },),
                ],
              ),
            ),
          )),
      ),
    );
  }
}