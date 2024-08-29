import 'package:flutter/material.dart';
import 'color_ext.dart';

extension CustomTextStyle on Text {
  Text styled(
      {double size = 14,
      Color color = C.text1,
      FontWeight weight = FontWeight.w400,
      TextAlign align = TextAlign.center,
      int lineLimit = 30}) {
    return Text(
      data!,
      textAlign: align,
      softWrap: true,
      maxLines: lineLimit,
      style: TextStyle(
          fontFamily: 'Inter',
          fontSize: size,
          color: color,
          fontWeight: weight),
    );
  }
}

enum Font { caption, body, headline, title }
