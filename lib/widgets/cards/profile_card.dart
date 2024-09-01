import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String username;
  const ProfileCard({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white
        ),
        padding: const EdgeInsets.all(9),
        child: Image.asset('assets/avatar.png',width: 35)
      ),
      title: Text(username),
      titleTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xffb8b8b8)
      ),
      subtitle: const Text('Software developer'),
      subtitleTextStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: Color(0xffb8b8b8)
      ),
    );
  }
}