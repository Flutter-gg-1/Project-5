import 'package:flutter/material.dart';

Widget buildTextField({required String hintText}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white.withOpacity(0.12),
        filled: true,
        hintStyle: const TextStyle(
            color: Color(0xffB8B8B8),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
