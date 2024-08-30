import 'package:blog_app/extension/size_config.dart';
import 'package:blog_app/widget/button/buttontext_with_line.dart';
import 'package:blog_app/widget/button/purple_button.dart';
import 'package:blog_app/widget/text/custom_text.dart';
import 'package:blog_app/widget/text_feild/custom_feild.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 19, top: 137,right: 19),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Welcome Back!',
                fontSize: 20,
              ),
              const Text(
                'Glad to see you again',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              Container(
                width: context.getWidth(),
                height: 400,
                margin: const EdgeInsets.only(top: 31),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 31),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff1e1e1e)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Username',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: Colors.white),
                    ),
                    const CustomTextFeild(
                      hintText: 'Enter your username',
                      maxLines: 1,
                      padding: EdgeInsets.only(top: 8, bottom: 12),
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: Colors.white),
                    ),
                    const CustomTextFeild(
                      hintText: 'Enter your password',
                      maxLines: 1,
                      padding: EdgeInsets.only(top: 8),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text('forget password'))),
                    Center(
                      child: PurpleButton(
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonWithLines(
                      text: 'Enter as a guest',
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
