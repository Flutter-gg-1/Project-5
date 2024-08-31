import 'package:flutter/material.dart';
import 'package:project_5/components/text/text_custom.dart';

class AccountStories extends StatelessWidget {
  const AccountStories(
      {super.key,
      required this.imagePath,
      required this.title,
      this.onTap,
      this.onPressedEdit,
      this.onPressedDelete});
  final String title;
  final String imagePath;
  final Function()? onTap;

  final Function()? onPressedEdit;
  final Function()? onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 78,
              width: 343,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff1E1E1E)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: 327,
                      height: 62,
                      child: Row(
                        children: [
                          Image.asset(imagePath),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustom(
                                  text: title,
                                  color: const Color(0xffB8B8B8),
                                  weight: FontWeight.w500,
                                  fontSize: 12),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
      Positioned(
        top: 38,
        left: 260,
        child: IconButton(
            onPressed: onPressedEdit,
            icon: const Icon(
              size: 16,
              Icons.edit_outlined,
              color: Colors.white,
            )),
      ),
      Positioned(
        top: 38,
        left: 285,
        child: IconButton(
            onPressed: onPressedDelete,
            icon: const Icon(
              size: 19,
              Icons.delete_outline,
              color: Colors.red,
            )),
      )
    ]);
  }
}
