import 'package:flutter/material.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
        child: const Divider(),
      ),
    );
  }
}