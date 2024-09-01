import 'package:blog_app_project/data/blog_data.dart';
import 'package:blog_app_project/helper/extensions/screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff111111),
        body: SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 20, bottom: 15, right: 20),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        fontFamily: 'Inter'),
                  ),
                ],
              ),
              Card(
                color: const Color(0xff111111),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: CircleAvatar(
                      child: Image.asset('assets/Vector(2).png'),
                    ),
                  ),
                  title: const Text('Kyle Barr',
                      style: TextStyle(
                          color: Color(0xffB8B8B8),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: 'Inter')),
                  subtitle: const Text('Software developer',
                      style: TextStyle(
                          color: Color(0xffB8B8B8),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: 'Inter')),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: GetIt.I.get<BlogData>().blogList.length,
                  itemBuilder: (context, index) {
                    final blog = GetIt.I.get<BlogData>().blogList[index];
                    return BlogProfile(
                      title: blog.title,
                      onClicked: () async {
                        await GetIt.I.get<BlogData>().removeBlog(id: index);
                        setState(() {});
                      },
                    );
                  },
                ),
              )
              // SizedBox(
              //   height: 300,
              //   child: ListView.builder(
              //     itemCount: GetIt.I.get<BlogData>().blogList.length,
              //     itemBuilder: (context, index) {
              //       final blog =
              //           GetIt.I.get<BlogData>().blogList[index];
              //       return BlogCardCustom(
              //         nameOfBlog: blog.authorName,
              //         title: blog.title,
              //         dateblog: blog.date,
              //         time: blog.minutesToRead.toString(),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        )));
  }
}

class BlogProfile extends StatelessWidget {
  const BlogProfile({super.key, required this.title, required this.onClicked});

  final String title;
  final Function()? onClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff1E1E1E),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Image.asset('assets/STK156_Instagram_threads_2 2.png'),
            title: Text(title,
                style: const TextStyle(
                    color: Color(0xffB8B8B8),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: 'Inter')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onClicked,
                icon: const Icon(
                  Icons.delete_forever_outlined,
                  size: 30,
                  color: Color(0xffFF0000),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
