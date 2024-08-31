import 'package:flutter/material.dart';

class SelectableBox extends StatelessWidget {
  const SelectableBox({super.key, required this.category, this.onTap});
  final String category;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
              color: Color(0xff595959),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Text(
            category,
            style: const TextStyle(
                color: Color(0xff2C2C2C),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}
