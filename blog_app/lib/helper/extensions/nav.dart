import 'package:flutter/material.dart';

extension Nav on BuildContext {
  navTo({required Widget page, onBack}) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => page))
        .then((valueReturn) {
      if (onBack != null) {
        onBack(valueReturn);
      }
    });
  }
}
