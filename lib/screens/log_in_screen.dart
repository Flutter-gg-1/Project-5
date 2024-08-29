import 'package:flutter/material.dart';
import 'package:project5/screens/home_screen.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
          minimum: const EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome Back!",
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Glad to see you again",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                width: 390,
                decoration: BoxDecoration(
                    color: const Color(0xff1E1E1E),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Username",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const CustomTextFormField(hintmsg: "Enter your username"),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const CustomTextFormField(hintmsg: "Enter your password"),
                      const SizedBox(
                        height: 8,
                      ),
                      const Align(
                          alignment: Alignment.bottomRight,
                          child: const Text("forget password",
                              style: TextStyle(
                                  color: Color(0xffBDA6F5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500))),
                      const SizedBox(
                        height: 30,
                      ),
                       CustomElevatedButton(
                        text: "Login",
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
                            return HomeScreen();
                          }), ModalRoute.withName('/'));
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: 35,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
                            return HomeScreen();
                          }), ModalRoute.withName('/'));
                              },
                              child: const Text(
                                "Enter as a guest",
                                style: TextStyle(color: Colors.white),
                              )),
                          Container(
                            height: 1,
                            width: 35,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
