import 'package:blog_app/data/post_data.dart';
import 'package:blog_app/data/user_data.dart';
import 'package:blog_app/helper/extensions/nav.dart';
import 'package:blog_app/screens/edit_screen.dart';
import 'package:blog_app/screens/signin_screen.dart';
import 'package:blog_app/services/setup.dart';
import 'package:blog_app/widgets/cards/user_blog.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff111111),
        bottom: AppBar(
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          title: const Text("Account"),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff111111),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: box.read("token") != null
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        textColor: const Color(0xffB8B8B8),
                        leading: Image.asset(
                            GetIt.I.get<UserData>().users.first.avatar ?? ""),
                        title:
                            Text(GetIt.I.get<UserData>().users.first.userName),
                        subtitle:
                            Text(GetIt.I.get<UserData>().users.first.position),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("My Blogs",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: GetIt.I.get<UserData>().users.first.posts ==
                              null
                          ? ([
                              const Text("No blogs yet",
                                  style: TextStyle(
                                      color: Color(0xffB8B8B8), fontSize: 16))
                            ])
                          : GetIt.I
                              .get<UserData>()
                              .users
                              .first
                              .posts!
                              .map((e) => UserBlog(
                                    onEdit: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return EditScreen(
                                            id: e.id,
                                            title: e.title,
                                            summary: e.summary,
                                            content: e.content,
                                            min: e.minutes,
                                            category: e.category);
                                      }));
                                    },
                                    onDelete: () {
                                      GetIt.I
                                          .get<PostData>()
                                          .removePost(id: e.id);
                                      setState(() {});
                                    },
                                    image: e.image,
                                    title: e.title,
                                  ))
                              .toList(),
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.red,
                              fixedSize: const Size(255, 50),
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: () {
                            box.remove("token");
                            // box.erase();
                            context.navTo(page: const SigninScreen());
                          },
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w800),
                          )),
                    ),
                  ],
                )
              : Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 337,
                    height: 191,
                    decoration: const BoxDecoration(
                        color: Color(0xff1E1E1E),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "You are not logged in yet",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xffBDA6F5),
                                fixedSize: const Size(255, 50),
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              context.navTo(page: const SigninScreen());
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w800),
                            )),
                      ],
                    ),
                  ),
                )),
    );
  }
}
