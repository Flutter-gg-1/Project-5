import 'package:flutter/material.dart';

import 'color_ext.dart';

extension IconStyling on Icon {
  Icon withSizeAndColor({double size = 32, Color color = C.text1}) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
