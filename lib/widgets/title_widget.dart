import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle(
      {super.key,
      required this.title,
      this.subTitle,
      this.titleFontSize,
      this.subTitleColorIsWhite,
      this.subTitleFontSize,
      this.subTitleIsBold,
      this.titleColorIsWhite,
      this.titleIsBold});

  final String title;
  final String? subTitle;
  final double? titleFontSize;
  final double? subTitleFontSize;
  final bool? titleColorIsWhite;
  final bool? subTitleColorIsWhite;
  final bool? titleIsBold;
  final bool? subTitleIsBold;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: titleIsBold == true ? FontWeight.bold : null,
            color: Color(titleColorIsWhite == true ? 0xffFFFFFF : 0xffB8B8B8)),
      ),
      subtitle: subTitle != null
          ? Text(
              subTitle!,
              style: TextStyle(
                  color: Color(
                      subTitleColorIsWhite == true ? 0xffFFFFFF : 0xffB8B8B8),
                  fontSize: subTitleFontSize,
                  fontWeight: subTitleIsBold == true
                      ? FontWeight.bold
                      : FontWeight.w300),
            )
          : null,
    );
  }
}
