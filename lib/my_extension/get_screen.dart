import 'package:flutter/material.dart';

extension GetScreen on BuildContext {
  getWidthScreen({double? width = 1}) {
    return MediaQuery.of(this).size.width * width!;
  }
  getHeightScreen({double?  height = 1}) {
    return MediaQuery.of(this).size.height * height!;
  }
}
