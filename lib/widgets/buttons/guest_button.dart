import 'package:flutter/material.dart';
import 'package:project5/screens/user_screen_navigator.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 1, width: 32.02,color: Colors.white),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const UserScreenNavigator();
                }
              ),
              (predicate) => false,
            );
          },
          child: const Text("Enter as a guest",style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w700
            )
          ),
        ),
        Container(height: 1, width: 32.02,color: Colors.white),
      ],
    );
  }
}