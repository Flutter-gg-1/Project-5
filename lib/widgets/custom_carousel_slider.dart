import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderCustome extends StatefulWidget {
  const CarouselSliderCustome({super.key});

  @override
  State<CarouselSliderCustome> createState() => _CarouselSliderCustomeState();
}

class _CarouselSliderCustomeState extends State<CarouselSliderCustome> {
  int currentIndex = 0;
  List arouselSliderList = [1, 2, 3];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: 190.0,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            items: arouselSliderList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    child: Image.asset(
                      'assets/STK156_Instagram_threads_2 1.png',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Positioned(
              top: 15,
              left: 160,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff9C9C9C).withOpacity(0.55),
                    borderRadius: BorderRadius.circular(25)),
                child: AnimatedSmoothIndicator(
                    effect: const CustomizableEffect(
                        dotDecoration: DotDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        activeDotDecoration: DotDecoration(
                            color: Colors.black26,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    activeIndex: currentIndex,
                    count: arouselSliderList.length),
              )),
          const Positioned(
              top: 120,
              left: 30,
              child: Text(
                'DJI • Jul 10, 2023',
                style: TextStyle(color: Color(0xffB8B8B8)),
              )),
          const Positioned(
            top: 140,
            left: 30,
            child: Text(
              'A month with DJI Mini 3 Pro',
              style: TextStyle(
                  color: Color(0xffB8B8B8),
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),
          const Positioned(
              top: 140,
              right: 30,
              child: Icon(
                Icons.arrow_upward_sharp,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
