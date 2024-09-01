import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5/src/data_layer/user_data.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  late String username;

  @override
  void initState() {
    super.initState();

    // Get the logged-in username
    username = GetIt.I.get<UserData>().whoIsLogin();

    // Load the profile image path from GetStorage
    final String? imagePath = GetIt.I.get<UserData>().getProfileImage(username);
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  // Method to pick an image from the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      // Save the picked image path in GetStorage
      GetIt.I.get<UserData>().saveProfileImage(username, pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Section with Image Picker
            Row(
              children: [
                // Wrap CircleAvatar in GestureDetector to trigger image picking
                GestureDetector(
                  onTap: _pickImage, // Trigger image picking on tap
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: _image != null
                        ? FileImage(_image!) // Display picked image
                        : const AssetImage('assets/profile.png')
                            as ImageProvider, // Default image
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username, // Display the username dynamically
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Software developer', // Replace with dynamic data
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'My Blogs',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Spacer(),
            // Logout Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle logout action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.white, // Set the button background color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Set the text color to red
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
