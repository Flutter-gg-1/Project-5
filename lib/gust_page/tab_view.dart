import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project/User_task/user_task.dart';
import 'package:project/gust_page/posts/posts.dart';
import 'package:project/gust_page/tech.dart';

class CustomTabView extends StatefulWidget {
  const CustomTabView({Key? key}) : super(key: key);

  @override
  _CustomTabViewState createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final UserTask userTask = GetIt.I<UserTask>();
  List<Tech> posts = [];

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  void loadPosts() {
    final allPosts = loadAllPosts(); 

    setState(() {
      posts = allPosts.map((post) {
        print("Loading post: ${post['title']}"); 
        return Tech(
          name: post['title'] ?? 'No Title',
          title: post['summary'] ?? 'No Summary',
          date: post['date'] ?? 'No Date',
        );
      }).toList();
    });
  }

  // الدالة الجديدة لتحميل جميع المنشورات
  List<Map<String, dynamic>> loadAllPosts() {
    return [
      {
        'title': 'Post Title 1',
        'summary': 'Summary of Post 1',
        'date': '2023-09-01',
      },
      {
        'title': 'Post Title 2',
        'summary': 'Summary of Post 2',
        'date': '2023-09-02',
      },
      // إضافة المزيد من المنشورات
    ];
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Text(
                    'Top Stories',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    'See all',
                    style: TextStyle(fontSize: 15, color: Color(0xff5b5b5b)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            posts.isEmpty
                ? Center(
                    child: Text('No posts available',
                        style: TextStyle(color: Colors.white)))
                : Expanded(
                    child: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        print(
                            "Displaying post: ${posts[index].name}"); 
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Posts(
                                  post: posts[index],
                                  onUpdate: (updatedPost) {
                                    setState(() {
                                      posts[index] = updatedPost;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          child: posts[index],
                        );
                      },
                    ),
                  ),
          ],
        ),
        const Center(child: Text('AI', style: TextStyle(color: Colors.white))),
        const Center(
            child: Text('Cloud', style: TextStyle(color: Colors.white))),
        const Center(
            child: Text('Robotics', style: TextStyle(color: Colors.white))),
        const Center(child: Text('IoT', style: TextStyle(color: Colors.white))),
      ],
    );
  }
}
