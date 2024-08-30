import 'package:flutter/material.dart';
import 'package:project5/widgets/buttons/guest_button.dart';
import 'package:project5/widgets/buttons/login_button.dart';
import 'package:project5/widgets/text_fields/login_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 137),
                const Text("Welcome Back!", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
                const Text("Glad to see you again", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                const SizedBox(height: 31,),
                Center(
                  child: Container(
                    width: 337,
                    height: 335,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xff1E1E1E)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 37,),
                        LoginTextField(inputName: 'Username', inputHint: 'Enter your username', controller: usernameController),
                        const SizedBox(height: 20,),
                        LoginTextField(inputName: 'Password', inputHint: 'Enter your password', controller: passwordController),
                        const SizedBox(height: 8,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("forget password", style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xffBDA6F5),
                              fontSize: 10
                              )
                            ),
                          ],
                        ),
                        const SizedBox(height: 34,),
                        Center(child: LoginButton(usernameController: usernameController, passwordController: passwordController,)),
                        const GuestButton()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}