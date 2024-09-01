import 'package:blog_app/data/user_data.dart';
import 'package:blog_app/screens/edit_blog.dart';
import 'package:blog_app/widgets/profile/login.dart';
import 'package:blog_app/widgets/profile/user_blog.dart';
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
    return GetIt.I.get<UserData>().loggedIn
        ? Scaffold(
            backgroundColor: const Color(0xff111111),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Stack(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        GetIt.I.get<UserData>().user.username,
                                        style: const TextStyle(
                                            color: Color(0xffB8B8B8)),
                                      ),
                                      Text(
                                        GetIt.I.get<UserData>().user.title,
                                        style: const TextStyle(
                                            color: Color(0xffB8B8B8)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "My Blogs",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                  children: GetIt.I
                                      .get<UserData>()
                                      .user
                                      .blogs
                                      .map((blog) {
                                return UserBlog(
                                    blog: blog,
                                    onDelete: () {
                                      GetIt.I
                                          .get<UserData>()
                                          .deleteBlog(blog);
                                      setState(() {});
                                    },
                                    onEdit: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return EditBlog(blog: blog);
                                      }));
                                    });
                              }).toList())
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                        bottom: 10,
                        left: 50,
                        right: 50,
                        child: GestureDetector(
                          onTap: () {
                            GetIt.I.get<UserData>().loggedIn = false;
                            setState(() {});
                          },
                          child: Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 210, 40, 10),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ))
                  ]),
                ),
              ),
            ),
          )
        : const Login();
  }
}
