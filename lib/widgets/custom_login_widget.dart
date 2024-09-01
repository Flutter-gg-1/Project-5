import 'package:blog_app_project/helper/extensions/screen.dart';
import 'package:blog_app_project/widgets/custom_button_widget.dart';
import 'package:blog_app_project/widgets/custom_textfiled.dart';
import 'package:flutter/material.dart';

class LoginContainerWidget extends StatelessWidget {
  const LoginContainerWidget({
    super.key,
    this.onDone,
  });
  final Function()? onDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth() / 1.1,
      height: context.getHeight() / 2,
      decoration: BoxDecoration(
          color: const Color(0xff1E1E1E),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Username',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xffB8B8B8)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          buildTextField(
            hintText: 'Enter your username',
          ),
          const SizedBox(
            height: 18,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xffB8B8B8)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          buildTextField(
            hintText: 'Enter your Password',
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {}, child: const Text('forgot password?')),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomButton(
            title: 'Login',
            onDone: onDone,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1,
                width: 32,
                color: const Color(0xffFFFFFF),
              ),
              TextButton(
                  onPressed: onDone,
                  child: const Text(
                    'Enter as a guest',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Color(0xffFFFFFF)),
                  )),
              Container(
                height: 1,
                width: 32,
                color: const Color(0xffFFFFFF),
              ),
            ],
          )
        ],
      ),
    );
  }
}
