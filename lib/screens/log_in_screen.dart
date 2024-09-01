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
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: Form(
        key: _formKey,
        child: SafeArea(
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
                  height: 450,
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
                        CustomTextFormField(hintmsg: "Enter your username", controller: usernameController, validator: (value) {
                          if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              }
                              return null;
                        },),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomText(text: "Password", color: Colors.white, size: 14, fontWeight: FontWeight.w500),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(hintmsg: "Enter your password", controller: passwordController, validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter password";
                              }
                              return null;
                            },
                            ),
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
                          onPressed: () async{
                            if(_formKey.currentState!.validate()){
                                 GetIt.I.get<UserData>().logIn(userName: usernameController.text, password: passwordController.text);
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                              return const HomeScreen();
                            }));}
                                  else{
                                   showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 100,
                                  color: const Color(0xff1E1E1E),
                                  child: const Center(
                                    child: CustomText(text: "Invalid username or password", color: Color(0xffBDA6F5), size: 18, fontWeight: FontWeight.bold,)
                                  ),
                                );
                              },
                              backgroundColor: Colors.transparent, // Optional: to make background transparent
                            );
                          }
                        }, textColor: Colors.white ,
                          backgroundColor: const Color(0xffBDA6F5).withOpacity(0.7), width: 173, height: 35, fontSize: 14,
                        ),
                        const SizedBox(
                          height: 30,
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
                                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                              return const HomeScreen();
                            }));
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
      ),
    );
  }
}
