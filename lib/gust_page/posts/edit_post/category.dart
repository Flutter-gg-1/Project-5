import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class CategorySelectorWidget extends StatelessWidget {
  const CategorySelectorWidget({super.key, required Null Function(dynamic category) onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomRadioButton(
            autoWidth: true,
            elevation: 0,
            absoluteZeroSpacing: false,
            unSelectedColor: const Color(0xff595959),
            selectedBorderColor: Colors.transparent,
            unSelectedBorderColor: Colors.transparent,
            selectedColor: Colors.white,
            buttonLables: const ['Technology', 'AI', 'Cloud', 'Robotic', 'IOT'],
            buttonValues: const ['Technology', 'AI', 'Cloud', 'Robotic', 'IOT'],
            buttonTextStyle: const ButtonTextStyle(
              selectedColor: Color(0xffA48BE2),
              unSelectedColor: Color(0xff2C2C2C),
              textStyle: TextStyle(fontSize: 16),
            ),
            customShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            radioButtonValue: (value) {},
          ),
        ),
      ],
    );
  }
}
