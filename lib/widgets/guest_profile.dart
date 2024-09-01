import 'package:flutter/material.dart';
import 'package:project5/widgets/buttons/profile_button.dart';

class GuestProfile extends StatelessWidget {
  const GuestProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 190),
        Center(
          child: Container(
            alignment: Alignment.center,
            width: 337,
            height: 191,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff1e1e1e)
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You are not logged in yet",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
                ),
                SizedBox(height: 47),
                ProfileButton(buttonName: 'Login', buttonNameColor: Color(0xffbda6f5))
              ],
            ),
          ),
        ),
      ],
    );
  }
}