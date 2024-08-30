import 'package:flutter/material.dart';
import 'package:project5/extensions/screen_size.dart';
import 'package:project5/widgets/buttons/login_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Color(0xff111111),
        appBar: AppBar(
            backgroundColor: Color(0xff1e1e1e),
            leading: Icon(
              Icons.list,
              color: Colors.white,
              size: 28,
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 28,
                    color: Colors.white,
                  ))
            ],
            bottom: PreferredSize(
                preferredSize: Size(context.getWidth(), 44),
                child: TabBar(
                    labelPadding: EdgeInsets.symmetric(vertical: 16),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 3,
                    indicatorColor: Color(0xffdd403c),
                    labelColor: Colors.white,
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    unselectedLabelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    unselectedLabelColor: Color(0xff888888),
                    tabs: [
                      Text("Tech"),
                      Text("AI"),
                      Text("Cloud"),
                      Center(child: Text("Robotics")),
                      Text("IoT"),
                    ]))),
        body: TabBarView(children: [
          // Column(
          //   children: [
          //     Container(
          //       width: 100,
          //       height: 100,
          //       // color: Colors.yellow,
          //       child:
          //     ),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: 343,
                  height: 180,
                  child: PageView(
                    children: [
                      Image.asset("assets/drone.png"),
                      Image.asset("assets/drone.png"),
                      Image.asset("assets/drone.png"),
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Divider(thickness: 1, color: Colors.white.withOpacity(.1),),
                SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Top Stories", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                    Text("See all", style: TextStyle(color: Color(0xff888888), fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(height: 12,),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        width: 343,
                        height: 108,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Color(0xff1e1e1e), borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/google.png", width: 80, height: 62,fit: BoxFit.cover,),
                          SizedBox(width: 8,),
                          SizedBox(
                            width: 239,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Kyle Barr", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Color(0xffb8b8b8)),),
                                Text("Now Google’s Bard AI can talk & respond to visual prompts", style: TextStyle(letterSpacing: -0.41,fontSize: 16, fontWeight: FontWeight.w600,color: Color(0xffe8e8e8)),),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text("Jul 13, 2023 ", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xff888888)),),
                              Text("• 2 min read", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xff888888)),),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(onTap: (){},child: Icon(Icons.bookmark_border, color: Color(0xff888888),)),
                              Icon(Icons.more_vert, color: Color(0xff888888),)
                            ],
                          )
                        ],
                      )
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        width: 343,
                        height: 108,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Color(0xff1e1e1e), borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/watch.png", width: 80, height: 62,fit: BoxFit.cover,),
                          SizedBox(width: 8,),
                          SizedBox(
                            width: 239,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Jeremy Morgan", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Color(0xffb8b8b8)),),
                                Text("WatchOS 10 preview: widgets all the way down", style: TextStyle(letterSpacing: -0.41,fontSize: 16, fontWeight: FontWeight.w600,color: Color(0xffe8e8e8)),),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text("Jul 10, 2023 ", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xff888888)),),
                              Text("• 4 min read", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xff888888)),),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(onTap: (){},child: Icon(Icons.bookmark_border, color: Color(0xff888888),)),
                              Icon(Icons.more_vert, color: Color(0xff888888),)
                            ],
                          )
                        ],
                      )
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        width: 343,
                        height: 108,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Color(0xff1e1e1e), borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/man.png", width: 80, height: 62,fit: BoxFit.cover,),
                          SizedBox(width: 8,),
                          SizedBox(
                            width: 239,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Amber Israelsen", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Color(0xffb8b8b8)),),
                                Text("How Gen Z are disrupting the definition of ‘prestigious’ jobs", style: TextStyle(letterSpacing: -0.41,fontSize: 16, fontWeight: FontWeight.w600,color: Color(0xffe8e8e8)),),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text("Jul 13, 2023 ", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xff888888)),),
                              Text("• 2 min read", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xff888888)),),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(onTap: (){},child: Icon(Icons.bookmark_border, color: Color(0xff888888),)),
                              Icon(Icons.more_vert, color: Color(0xff888888),)
                            ],
                          )
                        ],
                      )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Text("dfg", style: TextStyle(color: Colors.white)),
          Text("dfg", style: TextStyle(color: Colors.white)),
          Text("dfg", style: TextStyle(color: Colors.white)),
          Text("dfg", style: TextStyle(color: Colors.white)),
        ]),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Color(0xff111111),
          destinations: [
            NavigationDestination(icon: Icon(Icons.newspaper), label: 'Feed'),
            NavigationDestination(
                icon: Icon(Icons.explore_outlined), label: 'Explore'),
            NavigationDestination(
                icon: Icon(Icons.bookmark_border), label: 'Saved'),
            NavigationDestination(
                icon: Icon(Icons.person_2_outlined), label: 'Profile'),
          ],
          onDestinationSelected: (value) {
            print(value);
          },
        ),
      ),
    );
  }
}
