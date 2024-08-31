import 'package:flutter/material.dart';
import 'package:project_5/core/all_file.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      this.rightText,
      this.leftText,
      this.hintText,
      this.prefixIcon,
      this.controller});

  final String? rightText;
  final String? leftText;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 30),
          child: Text(
            leftText ?? '',
            style: const TextStyle(color: MyColors.whiteTextColor),
          ),
        ),
        TextField(
          keyboardType: TextInputType.text,
          style: const TextStyle(color: MyColors.whiteTextColor),
          controller: controller,
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
