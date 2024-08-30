import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 70),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            category,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14,
                color: Color(0xffA48BE2),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
