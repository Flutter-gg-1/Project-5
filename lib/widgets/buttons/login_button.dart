import 'package:flutter/material.dart';
import 'package:project5/extensions/screen_size.dart';
import 'package:project5/screens/home_screen.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  const LoginButton({super.key, required this.usernameController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 173,
      height: 35,
      child: ElevatedButton(
        style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        backgroundColor: WidgetStatePropertyAll(const Color(0xffBDA6F5).withOpacity(0.71))),
        onPressed: () {
          if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context){
                  return const HomeScreen();
                }
              )
            );
          }
          else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: const Color(0xff3e3e3e),
                  content: Container(
                    width: 50,
                    height: context.getHeight(divideBy: 7),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.close, color: Colors.red,size: 70),
                        Text("Account Not Found", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                      ],
                    ),
                  ),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(const Color(0xffBDA6F5).withOpacity(0.71))),
                      onPressed: ()=>Navigator.pop(context),
                      child: const Text("Back", style: TextStyle(color: Colors.white),)
                    )
                  ],
                );
              },
            );
          }
        },
        child: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),
        )
      ),
    );
  }
}