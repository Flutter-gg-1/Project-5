import 'package:flutter/material.dart';
import 'package:project5/extensions/screen_size.dart';

class NoResultsFound extends StatelessWidget {
  final String message;
  final IconData? icon;
  const NoResultsFound({super.key, required this.message, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: context.getHeight(divideBy: 3),),
        icon!=null ? Icon(icon,color: const Color(0xffb8b8b8)) : const SizedBox(),
        icon!=null ? const SizedBox(width: 10) : const SizedBox(),
        Text(
          message,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xffb8b8b8)
          )
        ),
      ],
    );
  }
}