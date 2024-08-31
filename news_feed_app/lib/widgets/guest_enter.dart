
import 'package:flutter/material.dart';

class GuestEnter extends StatelessWidget {
  const GuestEnter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: 2, width: 35, color: const Color(0xffffffff)),
          const Text('Enter as a guest', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700 ,color: Color(0xffffffff)),),
          Container(height: 2, width: 35, color: const Color(0xffffffff)),
        ],
      ),
    );
  }
}