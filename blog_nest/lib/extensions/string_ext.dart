import 'package:flutter/material.dart';
import 'color_ext.dart';

extension CustomTextStyle on Text {
  Text styled({
    double size = 14,
    Color color = C.text1,
    FontWeight weight = FontWeight.w400,
    TextAlign align = TextAlign.start,
    int lineLimit = 30,
    bool cross = false,
  }) {
    return Text(
      data!,
      textAlign: align,
      softWrap: true,
      maxLines: lineLimit,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: size,
        color: color,
        fontWeight: weight,
        decoration: cross ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

enum Font { caption, body, headline, title }
