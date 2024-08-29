import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintmsg});
  final String hintmsg;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                      decoration: InputDecoration(
                        hintText: hintmsg,
                        hintStyle: TextStyle(color: Color(0xffB8B8B8)),
                        filled: true,
                        fillColor: Color(0xffFFFFFF).withOpacity(0.12),
                      ),
                    );
  }
}