import 'package:flutter/material.dart';
import 'package:news_feed_app/data/models/profile_data_model.dart';
import 'package:news_feed_app/screens/nav_bar.dart';
import 'package:news_feed_app/widgets/custom_textfeild.dart';
import 'package:news_feed_app/widgets/guest_enter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  final UserModel userModel = UserModel();

  void login() {
    final enteredUsername = usernameController.text;
    final enteredPassword = passwordController.text;

    // Check if the entered credentials match
    if (enteredUsername == userModel.username && enteredPassword == userModel.password) {
      userModel.logIn(); // Update the loggedIn status
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavBar()));
    } else {
      // Show an error message if credentials are incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome Back!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xffffffff))),
              const Text('Glad to see you again', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Color(0xffffffff))),
              const SizedBox(height: 30),
              Container(
                width: 337,
                height: 360,
                decoration: const BoxDecoration(
                  color: Color(0xff1E1E1E),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Column(
                    children: [
                      TextContainer(
                        title: 'Username',
                        hint: 'Enter your username',
                        textController: usernameController, 
                      ),
                      const SizedBox(height: 15),
                      TextContainer(
                        title: 'Password',
                        hint: 'Enter your password',
                        textController: passwordController, 
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forget password?',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xffBDA6F5)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      LoginButton(
                        title: 'Login',
                        onPressed: login, 
                      ),
                      const SizedBox(height: 15),
                      const GuestEnter(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed; // Update to receive a callback

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 173,
      height: 35,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color(0xffBDA6F5)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        onPressed: onPressed, // Call the passed function
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}