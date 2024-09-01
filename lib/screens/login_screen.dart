import 'dart:math';

import 'package:blog_app/data_layer/user_data.dart';
import 'package:blog_app/helper/extension/color_ext.dart';
import 'package:blog_app/helper/extension/nav.dart';
import 'package:blog_app/models/user_model.dart';
import 'package:blog_app/screens/button_nav_bar.dart';
import 'package:blog_app/services/user_services/user_services.dart';
import 'package:blog_app/widgets/buttons/custom_button.dart';
import 'package:blog_app/widgets/cards/login_card.dart';
import 'package:blog_app/widgets/text_felid/custom_text_felid.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExt.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back!",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorExt.white),
              ),
              Text(
                "Glad to see you again",
                style: GoogleFonts.inter(fontSize: 15, color: ColorExt.white),
              ),
              LoginCard(
                userNameFelid: CustomTextFelid(
                  controller: usernameController,
                  hint: "Enter your username",
                  title: "Username",
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a valid Username" : null,
                ),
                passwordFelid: CustomTextFelid(
                  controller: passwordController,
                  hint: "Enter your Password",
                  title: "Password",
                  validator: (value) => value!.length < 8
                      ? "Please enter a valid Password"
                      : null,
                ),
                customButton: CustomButton(
                  foregroundColor: ColorExt.white,
                  backgroundColor: ColorExt.violet,
                  title: "Login",
                  height: 35,
                  width: 137,
                  onPressed: () {
                    if (usernameController!.text.isNotEmpty &&
                        passwordController!.text.isNotEmpty) {
                      UserModel newUser = UserModel(
                        userName: usernameController!.text,
                        id: Random().nextInt(999),
                      );
                      UserData userData = GetIt.I.get<UserData>();
                      userData.setCurrentUser(newUser);
                      GetIt.I
                          .get<UserService>()
                          .setUserName(usernameController!.text);

                      context.push(screen: const ButtonNavBar());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Please enter both username and password.'),
                        ),
                      );
                    }
                  },
                ),
                onTapGuest: () {
                  GetIt.I.get<UserService>().setUserName(null);
                  context.push(screen: const ButtonNavBar());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
