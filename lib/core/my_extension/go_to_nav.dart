import 'package:flutter/material.dart';

extension GoToNav on BuildContext {
  showScreen(Widget screen) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}