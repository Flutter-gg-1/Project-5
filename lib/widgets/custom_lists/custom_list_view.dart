import 'package:flutter/material.dart';

import '../custom_text/custom_text.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                        height: 30,
                        width: 110,
                        decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(2)),
                        child: const Center(
                          child: CustomText(
                            text: "Technology",
                            color: Color(0xffA48BE2),
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xff595959),
                            borderRadius: BorderRadius.circular(2)),
                        child: const Center(
                          child: CustomText(
                            text: "AI",
                            color: Color(0xff2C2C2C),
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            color: const Color(0xff595959),
                            borderRadius: BorderRadius.circular(2)),
                        child: const Center(
                          child: CustomText(
                            text: "Cloud",
                            color: Color(0xff2C2C2C),
                            size: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          color: const Color(0xff595959),
                          borderRadius: BorderRadius.circular(2)),
                      child: const Center(
                        child: CustomText(
                          text: "Robotic",
                          color: Color(0xff2C2C2C),
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 30,
                      width: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xff595959),
                          borderRadius: BorderRadius.circular(2)),
                      child: const Center(
                        child: CustomText(
                          text: "IoT",
                          color: Color(0xff2C2C2C),
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
  }
}