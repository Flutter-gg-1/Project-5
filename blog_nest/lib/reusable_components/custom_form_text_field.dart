import 'package:blog_nest/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import '../utils/typedefs.dart';
import '../utils/validations.dart';
import 'custom_text_field.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    required this.controller,
    required this.headerText,
    required this.hintText,
  });
  final TextEditingController controller;
  final String headerText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CAL.start,
        children: [
          Text(headerText).styled(size: 17, weight: FW.w700),
          CustomTextField(
              controller: controller,
              hint: hintText,
              validation: Validations.emptyFieldValidation)
        ],
      ),
    );
  }
}
