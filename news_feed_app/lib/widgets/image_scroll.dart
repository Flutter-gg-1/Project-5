
import 'package:flutter/material.dart';

class ImageScroll extends StatelessWidget {
  const ImageScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 343,
      height: 180,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xffffffff),
      ),
      child: Image.asset('assets/images/Card.png', fit: BoxFit.cover),
    );
  }
}