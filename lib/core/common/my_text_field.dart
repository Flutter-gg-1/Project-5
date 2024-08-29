import 'package:flutter/material.dart';
import 'package:project_5/core/all_file.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, this.rightText, this.leftText, this.hintText});

  final String? rightText;
  final String? leftText;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.getHeightScreen(height: 0.02)),
      child: Column(
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
            decoration: InputDecoration(
              filled: true,
              fillColor: MyColors.containerBlackLightColor,
              hintText: hintText ?? '',
              hintStyle: const TextStyle(color: MyColors.greyTextColor),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: context.getWidthScreen(width: 0.59),
              top: context.getHeightScreen(height: 0.04),
            ),
            child: Text(rightText ?? ''),
          ),
        ],
      ),
    );
  }
}
