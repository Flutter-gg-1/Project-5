import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text, this.onPressed});
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
                        child: ElevatedButton(
                          onPressed: onPressed, 
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffBDA6F5).withOpacity(0.7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          minimumSize: Size(173, 35)),
                          child: Text(text, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)),
                      );
  }
}