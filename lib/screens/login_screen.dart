import 'package:blog_app/screens/navigation_screens/home_screen.dart';
import 'package:blog_app/services/extensions/screen.dart';
import 'package:blog_app/services/setup.dart';
import 'package:blog_app/styles/colours.dart';
import 'package:blog_app/widgets/custom_navigation.dart';
import 'package:blog_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../data/blog_data.dart';
import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final key = GlobalKey<FormState>();
  User? user;

  @override
  void initState() {
    getUser();
    if (user != null && user!.isLoggedIn) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    user: user,
                  )));
    }
    super.initState();
  }

  getUser()async{
    user = locator.get<BlogData>().loggedUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colours.textPrimary),
            ),
            const Text(
              'Glad to see you again',
              style: TextStyle(fontSize: 15, color: Colours.textPrimary),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colours.surfaceTertiary,
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Username',
                      style:
                          TextStyle(fontSize: 14, color: Colours.iconPrimary),
                    ),
                    CustomTextField(
                      controller: nameController,
                      hint: 'Enter your username',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Password',
                      style:
                          TextStyle(fontSize: 14, color: Colours.iconPrimary),
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hint: 'Enter your password',
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'forgot password?',
                            style: TextStyle(
                                fontSize: 10, color: Colours.accentPurple),
                          )),
                    ),
                    Center(
                      child: SizedBox(
                        height: context.getHeight() / 23.2,
                        width: context.getWidth() / 2.17,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xffBDA6F5).withOpacity(0.71)),
                            onPressed: () async {
                              if (key.currentState!.validate()) {
                                for (var user
                                    in locator.get<BlogData>().users) {
                                  if (user.username == nameController.text &&
                                      user.password ==
                                          passwordController.text) {
                                    await locator
                                        .get<BlogData>()
                                        .saveLogin(user);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomNavigation(
                                                  user: user,
                                                )));
                                  }
                                }
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 14, color: Colours.iconPrimary),
                            )),
                      ),
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomNavigation()));
                          },
                          child: const Text(
                            '--- Enter as a guest ---',
                            style: TextStyle(
                                fontSize: 12, color: Colours.textPrimary),
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
