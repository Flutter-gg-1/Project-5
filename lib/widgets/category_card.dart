import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final bool isSelected;
  final Function()? onTap;
  const CategoryCard(
      {super.key,
      required this.category,
      required this.isSelected,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 70),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          color: isSelected ? Colors.white : const Color(0xff595959),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              category,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: isSelected
                      ? const Color(0xffA48BE2)
                      : const Color(0xff2C2C2C),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
