import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:blog_app/helper/extension/color_ext.dart';

class CategoryButton extends StatefulWidget {
  final String category;
  final bool isSelected;
  final ValueChanged<bool> onSelectionChanged;

  const CategoryButton({
    required this.category,
    required this.isSelected,
    required this.onSelectionChanged,
    super.key,
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class CategoryButtonState {}

class _CategoryButtonState extends State<CategoryButton> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onSelectionChanged(_isSelected);
      },
      child: Container(
        height: 26,
        width: 90,
        decoration: BoxDecoration(
          color: _isSelected ? ColorExt.white : ColorExt.greyOpc,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            color: _isSelected ? ColorExt.violet : Colors.transparent,
          ),
        ),
        child: Center(
          child: Text(
            widget.category,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: _isSelected ? ColorExt.violet : ColorExt.leaden,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
