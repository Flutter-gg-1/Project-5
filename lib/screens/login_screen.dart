import 'package:blog_app/widgets/navbar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "Glad to see you again",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 31,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0xff1E1E1E),
                      borderRadius: BorderRadius.circular(8)),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Username",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUnfocus,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: "Enter your username",
                              hintStyle: const TextStyle(
                                  color: Color(0xffB8B8B8), fontSize: 14),
                              fillColor: const Color(0x1FFFFFFF),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Username is required';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            obscureText: true,
                            autovalidateMode: AutovalidateMode.onUnfocus,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: "Enter your password",
                              hintStyle: const TextStyle(
                                  color: Color(0xffB8B8B8), fontSize: 14),
                              fillColor: const Color(0x1FFFFFFF),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Forget password",
                                style: TextStyle(
                                  color: Color(0xffBDA6F5),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // Replace this with your user authentication logic
                                bool userFound = false;
                                // Assuming `users` is a list of user objects with email and password fields
                                // Replace the below code with your actual authentication logic

                                

                                if (!userFound) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Incorrect email or password'),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Container(
                              height: 35,
                              width: 173,
                              decoration: BoxDecoration(
                                  color: const Color(0xb5BDA6F5),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                  child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Container(
                                  height: 1.0,
                                  width: 30.0,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "Enter as a guest",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Container(
                                  height: 1.0,
                                  width: 30.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
