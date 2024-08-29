import 'package:flutter/material.dart';
import 'package:project_5/components/buttons/login_button.dart';
import 'package:project_5/components/textfield/custom_text_field.dart';
import 'package:project_5/data_layer/login_data.dart';
import 'package:project_5/models/login_model.dart';
import 'package:project_5/pages/navbar.dart';
import 'package:project_5/services/setup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Welcome Back!",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            const Text(
              "Glad to see you again",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 31,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xff1E1E1E),
                  borderRadius: BorderRadius.circular(8)),
              height: 365,
              width: 337,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 37,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Username",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        controller: controllerUsername,
                        hintText: "Enter your username"),
                    const SizedBox(
                      height: 16,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                        controller: controllerPassword,
                        hintText: "Enter your password"),
                    const SizedBox(
                      height: 3,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "forget password",
                        style: TextStyle(
                            color: Color(0xffBDA6F5),
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                    LoginButton(
                      onPressed: () {
                        getIt.get<LoginData>().addUser(
                            newUser: LoginModel(
                                loginName: controllerUsername.text,
                                isLoggedIn: true));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Navbar()));
                      },
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1,
                          width: 32.02,
                          color: Colors.white,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Enter as a guest",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          width: 32.02,
                          color: Colors.white,
                        )
                      ],
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
