import 'package:flutter/material.dart';
import 'package:project_5/core/all_file.dart';

class MyPostTextField extends StatelessWidget {
  const MyPostTextField(
      {super.key,
      this.rightText,
      this.leftText,
      this.hintText,
      this.prefixIcon});

  final String? rightText;
  final String? leftText;
  final String? hintText;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          leftText ?? '',
          style: const TextStyle(color: MyColors.whiteTextColor),
        ),
        TextField(
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: MyColors.containerBlackLightColor,
            hintText: hintText ?? '',
            hintStyle: const TextStyle(color: MyColors.greyTextColor),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }
}
