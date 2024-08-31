import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project5/screens/home_screen.dart';

import '../data_layer/user_data.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
          minimum: const EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'Welcome Back!', size: 20, color:  Color(0xffffffff), fontWeight: FontWeight.bold,),
              const CustomText(text: "Glad to see you again", color: Color(0xffffffff), size: 15),
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
                      const CustomText(text: "Username", color: Colors.white, size: 14, fontWeight: FontWeight.w500),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(hintmsg: "Enter your username", controller: usernameController,),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(text: "Password", color: Colors.white, size: 14, fontWeight: FontWeight.w500),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(hintmsg: "Enter your password", controller: passwordController,),
                      const SizedBox(
                        height: 8,
                      ),
                      const Align(
                          alignment: Alignment.bottomRight,
                          child: CustomText(text: "forget password", color: Color(0xffBDA6F5), size: 14, fontWeight: FontWeight.w500),
                          ),
                      const SizedBox(
                        height: 30,
                      ),
                       CustomElevatedButton(
                        text: "Login",
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
                            return const HomeScreen();
                          }), ModalRoute.withName('/'));
                        }, textColor: Colors.white ,
                        backgroundColor: const Color(0xffBDA6F5).withOpacity(0.7), width: 173, height: 35, fontSize: 14,
                      ),
                      const SizedBox(
                        height: 20,
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
                                bool successfulLogIn = GetIt.I.get<UserData>().logIn(userName: usernameController.text, password: passwordController.text);
                                if(successfulLogIn){
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
                            return const HomeScreen();
                          }), ModalRoute.withName('/'));
                                }
                                else{
                                  showBottomSheet(context: context, builder: (BuildContext context){
                                    return Container(
                                      height: 100,
                                      child: Text("Ivalid username or password"),
                                    );
                                  });
                                }
                                
                              },
                              child: const CustomText(text: "Enter as a guest", color: Colors.white, size: 12)
                               ),
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
