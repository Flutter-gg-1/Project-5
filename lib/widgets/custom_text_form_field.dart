import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintmsg, this.prefixIcon, this.controller, this.validator});
  final String hintmsg;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      minLines: 1,
      maxLines: 20,
                      decoration: InputDecoration(
                        prefixIcon: prefixIcon,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), 
                        hintText: hintmsg,
                        hintStyle: const TextStyle(color: Color(0xffB8B8B8)),
                        filled: true,
                        fillColor: const Color(0xffFFFFFF).withOpacity(0.12),
                      ),
                    );
  }
}