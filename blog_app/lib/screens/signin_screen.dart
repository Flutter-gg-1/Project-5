import 'package:blog_app/current_page.dart';
import 'package:blog_app/helper/extensions/nav.dart';
import 'package:blog_app/services/login_controller.dart';
import 'package:blog_app/widgets/buttons/signin_button.dart';
import 'package:blog_app/widgets/fields/custom_form.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome Back!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
              const Text(
                "Glad to see you again",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 15),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                width: 337,
                height: 353,
                decoration: const BoxDecoration(
                    color: Color(0xff1E1E1E),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomForm(
                        controller: nameController,
                        label: "Username",
                        hint: "Enter your username"),
                    const SizedBox(height: 20),
                    CustomForm(
                        controller: passwordController,
                        label: "Password",
                        hint: "Enter your Password"),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "forget password?",
                        style: TextStyle(
                            color: Color(0xffBDA6F5),
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SignInButton(onPressed: () {
                        context.login(
                            username: nameController.text,
                            password: passwordController.text);
                      }),
                    ),
                    TextButton(
                        onPressed: () {
                          context.navTo(page: const CurrentPage());
                        },
                        child: const Text(
                          "Enter as a guest",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
