import 'package:blog_app/data_layer/get_blog.dart';
import 'package:blog_app/helper/nav.dart';
import 'package:blog_app/screens/edit_blog.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/screens/login_screen.dart';
import 'package:blog_app/widget/my_blog.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var user = GetIt.I.get<GetBlog>().currentUser;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text("Account"),
          ),
          user.userName.isNotEmpty
              ? Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(user.userName),
                      subtitle: const Text("Software Developer"),
                    ),
                    ...GetIt.I.get<GetBlog>().blogs.map((blog) {
                      return MyBlog(
                        imageSrc: blog.imageSrc,
                        writer: blog.authorName,
                        title: blog.title,
                        date: blog.date,
                        min: blog.minutesToRead,
                        delete: () {
                          GetIt.I.get<GetBlog>().delete(blog);
                          setState(() {});
                        },
                        edit: () {
                          context.navToUpdate(
                              EditBlog(
                                blog: blog,
                              ), () {
                            setState(() {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            });
                          });
                        },
                      );
                    })
                  ],
                )
              : ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text("Log In"),
                ),
        ],
      ),
    );
  }
}
