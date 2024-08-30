import 'package:blog_app_project/widgets/custom_login_widget.dart';
import 'package:blog_app_project/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff111111),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextTitle(
                title: 'Welcome Back!',
                subTitle: 'Glad to see you again',
                titleFontSize: 20,
                titleIsBold: true,
                subTitleColorIsWhite: true,
                titleColorIsWhite: true,
                subTitleFontSize: 15,
              ),
              SizedBox(
                height: 25,
              ),
              LoginContainerWidget()
            ],
          ),
        ),
      ),
    );
  }
}
