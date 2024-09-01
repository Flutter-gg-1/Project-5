import 'package:blog_app_project/screens/navigation_bottom.dart';
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
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextTitle(
                  title: 'Welcome Back!',
                  subTitle: 'Glad to see you again',
                  titleFontSize: 20,
                  titleIsBold: true,
                  subTitleColorIsWhite: true,
                  titleColorIsWhite: true,
                  subTitleFontSize: 15,
                ),
                const SizedBox(
                  height: 25,
                ),
                LoginContainerWidget(
                  onDone: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const NavigationBottom();
                      }));
                    }
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const NavigationBottom();
                    }));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
