import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    this.selectedValue,
    required this.onCategorySelected,
  });

  final String? selectedValue;
  final ValueChanged<String> onCategorySelected; 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GroupButton(
            options: const GroupButtonOptions(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              selectedColor: Color(0xffffffff),
              unselectedColor: Color(0xff595959),
              selectedTextStyle: TextStyle(color: Color(0xffA48BE2), fontSize: 14, fontWeight: FontWeight.w700),
              unselectedTextStyle: TextStyle(color: Color(0xff2C2C2C), fontSize: 14, fontWeight: FontWeight.w700),
            ),
            isRadio: true,
            buttons: const ['TECHNOLOGY', 'AI', 'CLOUD', 'ROBOTICS', 'IOT'],
            onSelected: (value, index, isSelected) {
              onCategorySelected(value); // Notify the parent about the selection
            },
          ),
        ],
      ),
    );
  }
}