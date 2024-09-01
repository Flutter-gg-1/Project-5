import 'package:flutter/material.dart';

class SelectableCategories extends StatelessWidget {
  final List<String> categories = [
    'TECHNOLOGY',
    'AI',
    'CLOUD',
    'ROBOTIC',
    'IOT'
  ];
  final String selectedCategory;
  final Function(String) onCategorySelected;

  SelectableCategories({
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Category *',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Wrap(
          spacing: 4.0,
          children: categories.map((category) {
            return GestureDetector(
              onTap: () => onCategorySelected(category),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  decoration: BoxDecoration(
                    color: selectedCategory == category
                        ? Colors.white 
                        : Color.fromRGBO(50, 50, 50, 1), 
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      color: selectedCategory == category
                          ? Color.fromRGBO(124, 77, 255, 1)
                          : Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
