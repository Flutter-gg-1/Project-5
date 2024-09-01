import 'package:flutter/material.dart';
import 'package:news_feed_app/screens/nav_bar.dart';
import 'package:news_feed_app/widgets/custom_textfeild.dart';
import 'package:news_feed_app/widgets/guest_enter.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisAlignment:MainAxisAlignment.center,
              children: [
                 const Text('Welcome Back!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700 ,color: Color(0xfffffffff)),),
                 const Text('Glad to see you again', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300 ,color: Color(0xfffffffff)),),
                 const SizedBox(height: 30,),
                 Container(
                  width: 337,
                  height: 360,
                  decoration: const BoxDecoration(
                    color: Color(0xff1E1E1E),
                    borderRadius:BorderRadius.all(Radius.circular(8))
                  ),
                  child:  Padding(
                    padding:  EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: Column(
                      children: [
                        TextContainer(title: 'Username', hint: 'Enter your username',),
                        SizedBox(height: 15,),
                        TextContainer(title: 'Password', hint: 'Enter your password',),
                        SizedBox(height: 5,),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.end, 
                        children: [
                           Text(
                            'Forget password?',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xffBDA6F5)),
                          ),
                        ],
                      ),                        
                      SizedBox(height: 30,),
                        LoginButton(title: 'Login',),
                        SizedBox(height: 15,),
                       GuestEnter()
                      ],
                    ),
                  ),
                 )
              ],
            ),
          ),
        ),
      );
  }
}


class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.title});

  final String title;
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
        onPressed: () {
          Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => const NavBar()));
        },
        child: const Text(
          'Login',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}
