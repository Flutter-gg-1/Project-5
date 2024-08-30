import 'package:blog_nest/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import '../extensions/color_ext.dart';
import '../utils/typedefs.dart';

class CustomBtnView extends StatelessWidget {
  const CustomBtnView({
    super.key,
    this.isLogin = true,
    required this.callBack,
  });

  final bool isLogin;
  final VoidCallback callBack;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isLogin ? C.accent : C.text1,
        shape: RoundedRectangleBorder(borderRadius: BR.circular(8)),
      ),
      onPressed: () => callBack(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
          child: Text(isLogin ? 'Login' : 'Logout').styled(
              size: 14, weight: FW.w700, color: isLogin ? C.text1 : C.red),
        ),
      ),
    );
  }
}
