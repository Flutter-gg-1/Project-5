import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_5/src/data_layer/user_data.dart';
import 'package:project_5/src/home/guest_home_screen.dart';
import 'package:project_5/src/theme/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? passwordError;
  String? nameError;
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var allUser = GetIt.I.get<UserData>();

  @override
  void initState() {
    // print(allUser.length);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed to avoid memory leaks
    nameController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Glad to see you again',
                style: TextStyle(color: AppColors.grey),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      style: const TextStyle(color: AppColors.white),
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle(color: AppColors.white),
                        hintText: 'Enter your username',
                        hintStyle: const TextStyle(color: AppColors.grey),
                        filled: true,
                        errorText: nameError,
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        validateName(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passController,
                      obscureText: true,
                      style: const TextStyle(color: AppColors.white),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: AppColors.white),
                        hintText: 'Enter your password',
                        hintStyle: const TextStyle(color: AppColors.grey),
                        filled: true,
                        errorText: passwordError,
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        validatePassword(value);
                      },
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forget password',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (nameController.text.isNotEmpty) {
                            String username = nameController.text;
                            String password = passController.text;
                            bool authentication = allUser.checkUserData(
                                username: username, password: password);

                            // Check
                            if (authentication == true) {
                              // save login data in storage
                              allUser.login(username);

                              // nav to home
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const GuestHomeScreen()));
                            } 
                      
                          }
                        
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Login',
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Navigate to the GuestScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GuestHomeScreen()),
                  );
                },
                child: const Text(
                  '---   Enter as a guest   ---',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      setState(() {
        passwordError = 'Please enter your password';
      });
    } else if (value.length < 6) {
      setState(() {
        passwordError = 'Password must be at least 6 characters';
      });
    } else {
      setState(() {
        passwordError = null;
      });
    }
  }

  void validateName(String value) {
    if (value.isEmpty) {
      setState(() {
        nameError = 'Please enter your username';
      });
    } else {
      setState(() {
        nameError = null;
      });
    }
  }
}
