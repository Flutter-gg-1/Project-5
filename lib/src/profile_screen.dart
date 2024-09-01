import 'package:blog_app/data_layer/blog_data.dart';
import 'package:blog_app/data_layer/user_data.dart';
import 'package:blog_app/extension/size_config.dart';
import 'package:blog_app/src/login_screen.dart';
import 'package:blog_app/widget/card/blog_card.dart';
import 'package:blog_app/widget/text/custom_text.dart';
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
    final locator = GetIt.I.get<UserData>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: SafeArea(
          child: locator.isGust == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Account',
                      fontSize: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Image.asset('assest/image/Vector.png'),
                        ),
                        SizedBox(
                          width: 300,
                          height: 56,
                          child: ListTile(
                            title: Text(
                              locator.currentUser,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 176, 171, 171)),
                            ),
                            subtitle: const Text(
                              'Flutter dev',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 176, 171, 171)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const CustomText(text: 'My blogs'),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: GetIt.I
                              .get<BlogData>()
                              .blogs
                              .map(
                                (e) => e.writer == locator.currentUser
                                    ? BlogCard(
                                        writer: e.writer,
                                        title: e.title,
                                        timeToRead: e.time,
                                        creationDate: e.creationDate,
                                        isFaveiorte: e.isFaveiorte,
                                        category: e.category,
                                        summary: e.summary,
                                        content: e.content,
                                        id: e.id,
                                        removeOption: true,
                                        onPressedDelate: () {
                                          GetIt.I
                                              .get<BlogData>()
                                              .removeBlog(id: e.id);
                                          setState(() {});
                                        },
                                      )
                                    : const Text(''),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {
                        locator.guestLogin();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          fixedSize: Size(context.getHeight() / 4, 50)),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.red),
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'Account',
                        fontSize: 20,
                      ),
                      SizedBox(
                        height: context.getHeight() * 0.25,
                      ),
                      Container(
                        width: double.infinity,
                        height: 191,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xff1e1e1e)),
                        child: Center(
                          child: Column(
                            children: [
                              const CustomText(text: 'You are not login yet'),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    fixedSize:
                                        Size(context.getHeight() / 4, 50)),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xffbaa4f3)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}
