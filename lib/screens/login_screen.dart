import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 19),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 137),
                Text("Welcome Back!", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                Text("Glad to see you again", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),),
                SizedBox(height: 31,),
                Center(
                  child: Container(
                    width: 337,
                    height: 335,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xff1E1E1E)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 37,),
                        Text("Username", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white)),
                        SizedBox(height: 8,),
                        Container(
                          height: 41,
                          width: 303,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            onTapOutside: (e) => FocusManager.instance.primaryFocus?.unfocus(),
                            decoration: InputDecoration(
                              hintText: "Enter your username",
                              hintStyle: TextStyle(color: Color(0xffB8B8B8), fontSize: 14, fontWeight: FontWeight.w500),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.12),
                              border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Password", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white)),
                        SizedBox(height: 8,),
                        Container(
                          height: 41,
                          width: 303,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            onTapOutside: (e) => FocusManager.instance.primaryFocus?.unfocus(),
                            decoration: InputDecoration(
                              hintText: "Enter your password",
                              hintStyle: TextStyle(color: Color(0xffB8B8B8), fontSize: 14, fontWeight: FontWeight.w500),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.12),
                              border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8))
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("forget password", style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xffBDA6F5), fontSize: 10),),
                          ],
                        ),
                        SizedBox(height: 34,),
                        Center(
                          child: Container(
                            width: 173,
                            height: 35,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                backgroundColor: WidgetStatePropertyAll(Color(0xffBDA6F5).withOpacity(0.71)),
                              ),
                              onPressed: (){
                            
                            }, child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(height: 1, width: 32.02,color: Colors.white,),
                            TextButton(onPressed: (){}, child: Text("Enter as a guest", style: TextStyle(color: Colors.white),),),
                            Container(height: 1, width: 32.02,color: Colors.white,),
                          ],
                        )
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