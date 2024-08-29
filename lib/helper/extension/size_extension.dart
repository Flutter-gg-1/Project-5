import 'package:flutter/material.dart';

extension Sizes on BuildContext {
  getWidth({double divide = 1}) {
    return MediaQuery.of(this).size.width / divide;
  }
}
