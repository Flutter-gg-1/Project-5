import 'package:flutter/material.dart';

extension Nav on BuildContext {
  navTo(Widget screen) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }

  navToUpdate(Widget screen, Function setStateCallback) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => screen),
    ).then((value) {
      setStateCallback();
    });
  }
}
