import 'package:blog_app/data/post_data.dart';
import 'package:blog_app/data/user_data.dart';
import 'package:blog_app/helper/extensions/nav.dart';
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                textColor: const Color(0xffB8B8B8),
                leading: Image.asset(
                    GetIt.I.get<UserData>().users.first.avatar ?? ""),
                title: Text(GetIt.I.get<UserData>().users.first.userName),
                subtitle: Text(GetIt.I.get<UserData>().users.first.position),
              ),
            ),
            const SizedBox(height: 20),
            const Text("My Blogs",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: GetIt.I.get<UserData>().users.first.posts == null
                  ? ([
                      const Text("No blogs",
                          style:
                              TextStyle(color: Color(0xffB8B8B8), fontSize: 20))
                    ])
                  : GetIt.I
                      .get<UserData>()
                      .users
                      .first
                      .posts!
                      .map((e) => UserBlog(
                            onDelete: () {
                              GetIt.I.get<PostData>().removePost(id: e.id);
                              setState(() {});
                            },
                            image: e.image,
                            title: e.title,
                          ))
                      .toList(),
            ),
            ElevatedButton(
                onPressed: () {
                  box.remove("token");
                  // box.erase();
                  context.navTo(page: const SigninScreen());
                },
                child: const Text("logout")),
          ],
        ),
      ),
    );
  }
}
