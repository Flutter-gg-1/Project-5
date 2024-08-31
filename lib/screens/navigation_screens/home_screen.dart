import 'package:blog_app/screens/add_post_screen.dart';
import 'package:blog_app/widgets/tab_body.dart';
import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../styles/colours.dart';

class HomeScreen extends StatefulWidget {
  final User? user;
  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late List<Widget> tabs;
  late User? user;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    tabs = [
      const Text('Tech'),
      const Text('AI'),
      const Text('Cloud'),
      const Text(
        'Robotics',
      ),
      const Text('IoT'),
    ];
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colours.surfaceTertiary,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 16, right: 16, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu, color: Colours.iconPrimary),
                    Row(
                      children: [
                        const Icon(Icons.search, color: Colours.iconPrimary),
                        const SizedBox(width: 16),
                        if (user != null)
                          if (user!.isLoggedIn)
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (contex) =>
                                              const AddPostScreen()));
                                },
                                child: const Icon(Icons.add,
                                    color: Colours.iconPrimary)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Colours.surfaceTertiary,
                child: TabBar(
                  labelColor: Colours.textPrimary,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  indicatorColor: Colours.accentRed,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colours.textTertiary,
                  unselectedLabelColor: Colours.textTertiary,
                  labelPadding: const EdgeInsets.all(0),
                  controller: tabController,
                  tabs: tabs,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TabBarView(controller: tabController, children: [
              TabBody(
                tabIndex: 0,
                user: user,
              ),
              TabBody(
                tabIndex: 1,
                user: user,
              ),
              TabBody(
                tabIndex: 2,
                user: user,
              ),
              TabBody(
                tabIndex: 3,
                user: user,
              ),
              TabBody(
                tabIndex: 4,
                user: user,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
