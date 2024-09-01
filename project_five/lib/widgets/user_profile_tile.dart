import 'package:flutter/material.dart';

class UserProfileTile extends StatelessWidget {
  final String username;

  const UserProfileTile({required this.username});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/images/Vector.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        username,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        "Software developer",
        style: TextStyle(
          fontSize: 12,
          color: Colors.white70,
        ),
      ),
    );
  }
}
