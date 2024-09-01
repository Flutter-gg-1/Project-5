import 'package:flutter/material.dart';

extension Nav on BuildContext {
  push({required Widget screen, Function(dynamic)? onBack}) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }
  void pushAndRemoveUntil({required Widget screen}) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }
}
