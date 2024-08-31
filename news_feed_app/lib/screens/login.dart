import 'package:flutter/material.dart';
import 'package:news_feed_app/screens/feed.dart';

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
                  height: 335,
                  decoration: const BoxDecoration(
                    color: Color(0xff1E1E1E),
                    borderRadius:BorderRadius.all(Radius.circular(8))
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: Column(
                      children: [
                        TextCOntainer(title: 'Username', hint: 'Enter your username',),
                        SizedBox(height: 15,),
                        TextCOntainer(title: 'Password', hint: 'Enter your password',),
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

class TextCOntainer extends StatelessWidget {
  const TextCOntainer({super.key, required this.title, required this.hint});
  final String title;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
         Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500 ,color: Color(0xfffffffff)),),
          const SizedBox(height: 10,),
          SizedBox(
            height: 40,
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(54, 255, 255, 255),
                hintText: hint,
                hintStyle: const TextStyle(fontSize: 14, color: Color(0xffB8B8B8)),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                border: const OutlineInputBorder( 
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ),
      ],
      
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
          Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => const FeedPage()));
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

class GuestEnter extends StatelessWidget {
  const GuestEnter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: 2, width: 35, color: const Color(0xffffffff)),
          const Text('Enter as a guest', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700 ,color: Color(0xffffffff)),),
          Container(height: 2, width: 35, color: const Color(0xffffffff)),
        ],
      ),
    );
  }
}