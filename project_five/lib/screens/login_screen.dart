import 'package:blogs_app/screens/mainWidget_screen.dart';
import 'package:blogs_app/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../data/services/auth_service.dart';
import '../helper/locator.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final AuthService authService = locator<AuthService>();
  final TextEditingController sernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final GetStorage storage = GetStorage();

  void login() {
    if (formKey.currentState!.validate()) {
      String username = sernameController.text;
      String password = passwordController.text;
      authService.login(username, password);
      storage.write('username', username);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
  }

  void loginAsGuest() {
    authService.loginAsGuest();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }

  void forgotPassword() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Welcome Back!",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    "Glad to see you again",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(30, 30, 30, 1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(4.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextField(
                          label: 'Username',
                          controller: sernameController,
                          hintText: "Enter your username",
                        ),
                        SizedBox(height: 6.0),
                        CustomTextField(
                          label: 'Password',
                          controller: passwordController,
                          hintText: "Enter your password",
                          keyboardType: TextInputType.visiblePassword,
                          maxLines: 1,
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: forgotPassword,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color.fromRGBO(189, 166, 245, 0.71),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                          width: 173,
                          child: ElevatedButton(
                            onPressed: login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromRGBO(189, 166, 245, 0.71),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextButton(
                                onPressed: loginAsGuest,
                                child: Text(
                                  'Enter as Guest',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
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
