import 'package:flutter/material.dart';

extension Nav on BuildContext {
  navTo({required Widget page}) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => page));
  }
}
