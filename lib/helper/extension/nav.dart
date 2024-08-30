import 'package:flutter/material.dart';

extension Nav on BuildContext {
  push({required Widget screen, Function(dynamic)? onBack}) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }
}
