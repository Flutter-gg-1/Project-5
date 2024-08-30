import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xff111111),
        appBar: AppBar( 
          backgroundColor: const Color(0xff1E1E1E),
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions: const [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
          ],
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color(0xffDD403C),
            labelColor: Colors.white,
            tabs: [
              Tab(text: "Tech"),
              Tab(text: "AI"),
              Tab(text: "Cloud"),
              Tab(text: "Robotics"),
              Tab(text: "IoT"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top:16.0,left:16.0,right:16.0,),
          child: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("assets/home/drone.png"),
                    Divider(
                      color: Colors.white.withOpacity(0.1),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Stories",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See all",
                          style:
                              TextStyle(color: Color(0xff888888), fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: const Color(0xff1E1E1E),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 62,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.asset(
                                    "assets/home/google.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Kyle Barr",
                                      style: TextStyle(
                                        color: Color(0xffB8B8B8),
                                      )),
                                  SizedBox(
                                    width: 240,
                                    child: Text(
                                        "Now Google’s Bard AI can talk & respond to visual prompts",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text("Jul 13, 2023 • 2 min read",
                                      style: TextStyle(
                                        color: Color(0xffB8B8B8),
                                        fontSize: 10,
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.bookmark_outline_outlined,
                                    color: Color(0xffB8B8B8),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Color(0xffB8B8B8),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: const Color(0xff1E1E1E),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 62,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.asset(
                                    "assets/home/google.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Kyle Barr",
                                      style: TextStyle(
                                        color: Color(0xffB8B8B8),
                                      )),
                                  SizedBox(
                                    width: 240,
                                    child: Text(
                                        "Now Google’s Bard AI can talk & respond to visual prompts",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text("Jul 13, 2023 • 2 min read",
                                      style: TextStyle(
                                        color: Color(0xffB8B8B8),
                                        fontSize: 10,
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.bookmark_outline_outlined,
                                    color: Color(0xffB8B8B8),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Color(0xffB8B8B8),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: const Color(0xff1E1E1E),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 62,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.asset(
                                    "assets/home/google.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Kyle Barr",
                                      style: TextStyle(
                                        color: Color(0xffB8B8B8),
                                      )),
                                  SizedBox(
                                    width: 240,
                                    child: Text(
                                        "Now Google’s Bard AI can talk & respond to visual prompts",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text("Jul 13, 2023 • 2 min read",
                                      style: TextStyle(
                                        color: Color(0xffB8B8B8),
                                        fontSize: 10,
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.bookmark_outline_outlined,
                                    color: Color(0xffB8B8B8),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Color(0xffB8B8B8),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: const Color(0xff1E1E1E),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 62,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.asset(
                                    "assets/home/google.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Kyle Barr",
                                      style: TextStyle(
                                        color: Color(0xffB8B8B8),
                                      )),
                                  SizedBox(
                                    width: 240,
                                    child: Text(
                                        "Now Google’s Bard AI can talk & respond to visual prompts",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text("Jul 13, 2023 • 2 min read",
                                      style: TextStyle(
                                        color: Color(0xffB8B8B8),
                                        fontSize: 10,
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.bookmark_outline_outlined,
                                    color: Color(0xffB8B8B8),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Color(0xffB8B8B8),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              const Column(
                children: [Text("data2")],
              ),
              const Column(
                children: [Text("data3")],
              ),
              const Column(
                children: [Text("data4")],
              ),
              const Column(
                children: [Text("data5")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
