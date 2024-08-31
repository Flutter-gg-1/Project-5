import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key, this.height,
  });
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      color: Colors.transparent,
    );
  }
}