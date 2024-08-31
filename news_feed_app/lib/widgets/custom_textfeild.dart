import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({
    super.key,
    required this.title,
    required this.hint,
    this.showIcon = false, 
  });

  final String title;
  final String hint;
  final bool showIcon; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xffffffff)),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          width: 370,
          child: TextFormField(
            style: const TextStyle(color: Colors.white), // User input text color
            decoration: InputDecoration(
              prefixIcon: showIcon
                  ? Padding(
                      padding: const EdgeInsets.all(8.0), 
                      child: SvgPicture.asset(
                        color: Color(0xffB8B8B8),
                        'assets/svg/search.svg',
                        height: 24,
                        width: 24,
                      ),
                    )
                  : null, // No icon if showIcon is false
              filled: true,
              fillColor: const Color.fromARGB(54, 255, 255, 255),
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 14, color: Color(0xffB8B8B8)),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}