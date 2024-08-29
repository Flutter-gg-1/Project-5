import 'package:blog_nest/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import '../extensions/color_ext.dart';
import '../utils/typedefs.dart';

class CustomBtnView extends StatelessWidget {
  const CustomBtnView({super.key, required this.callBack});

  final VoidCallback callBack;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: C.accent,
        shape: RoundedRectangleBorder(borderRadius: BR.circular(8)),
      ),
      onPressed: () => callBack(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
          child: const Text('Login').styled(size: 14, weight: FW.w700),
        ),
      ),
    );
  }
}
