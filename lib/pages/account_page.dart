import 'package:flutter/material.dart';
import 'package:project_5/components/stories/account_stories.dart';
import 'package:project_5/components/text/text_custom.dart';
import 'package:project_5/data_layer/blog_data.dart';
import 'package:project_5/data_layer/login_data.dart';
import 'package:project_5/pages/blog_page.dart';
import 'package:project_5/pages/edit_blog_screen.dart';
import 'package:project_5/pages/login_screen.dart';
import 'package:project_5/services/setup.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var user = getIt.get<LoginData>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff111111),
        title: const TextCustom(
            text: "Account",
            color: Colors.white,
            weight: FontWeight.w700,
            fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: user.checkLogin()
            ? Column(
                children: [
                  SizedBox(
                    height: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Center(
                                  child: Image.asset(
                                "assets/Vector.png",
                                height: 37.94,
                                width: 39.01,
                              )),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextCustom(
                                    text: user.getName ?? "Kyle Barr",
                                    color: const Color(0xffB8B8B8),
                                    weight: FontWeight.w500,
                                    fontSize: 15),
                                const TextCustom(
                                    text: "Software developer",
                                    color: Color(0xffB8B8B8),
                                    weight: FontWeight.w500,
                                    fontSize: 10)
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 43,
                        ),
                        const TextCustom(
                            text: "My Blogs",
                            color: Colors.white,
                            weight: FontWeight.w700,
                            fontSize: 18),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 370,
                        child: SingleChildScrollView(
                          child: Column(
                              children: getIt
                                  .get<BlogData>()
                                  .blogs
                                  .map((e) => AccountStories(
                                        onTap: () {
                                          Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BlogPage(
                                                              selectedId:
                                                                  e.id)))
                                              .then((onValue) {
                                            if (onValue != null) {
                                              setState(() {});
                                            }
                                          });
                                        },
                                        onPressedEdit: () {
                                          Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditBlogScreen(
                                                              selectedId:
                                                                  e.id)))
                                              .then((onValue) {
                                            if (onValue != null) {
                                              setState(() {});
                                            }
                                          });
                                        },
                                        onPressedDelete: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                  'Confirm Deletion',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                content: const Text(
                                                  'Are you sure you want to delete this blog?',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.redAccent,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16,
                                                          vertical: 8),
                                                    ),
                                                    onPressed: () {
                                                      getIt
                                                          .get<BlogData>()
                                                          .deleteBlog(id: e.id);
                                                      setState(() {});
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text(
                                                      'Delete',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        imagePath:
                                            "assets/STK156_Instagram_threads_2 2.png",
                                        title: e.title,
                                      ))
                                  .toList()),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Container(
                          height: 50,
                          width: 255,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Center(
                            child: TextButton(
                                onPressed: () {
                                  user.logOut();

                                  setState(() {});
                                },
                                child: const TextCustom(
                                    text: "Logout",
                                    color: Color(0xffDD403C),
                                    weight: FontWeight.w800,
                                    fontSize: 24)),
                          ))
                    ],
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 337,
                    height: 191,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff1E1E1E)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Column(
                          children: [],
                        ),
                        const TextCustom(
                            text: "You are not logged in yet",
                            color: Colors.white,
                            weight: FontWeight.w700,
                            fontSize: 12),
                        Container(
                            height: 50,
                            width: 255,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Center(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  },
                                  child: const TextCustom(
                                      text: "LogIn",
                                      color: Color(0xffBDA6F5),
                                      weight: FontWeight.w800,
                                      fontSize: 24)),
                            ))
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
