import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  SearchField({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.white
      ),
      controller: controller,
      decoration: InputDecoration(
                              hintText: "Search for Blogs",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(184, 184, 184, 1)),
                              filled: true,
                              fillColor: Color.fromRGBO(227, 217, 217, 0.118),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: onChanged,
    );
  }
}
