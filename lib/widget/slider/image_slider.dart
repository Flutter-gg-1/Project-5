import 'package:carousel_custom_slider/carousel_custom_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.slides,
  });

  final List<Map<String, String>> slides;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: CarouselCustomSlider.advancedCarouselSlider(
        isDisplayIndicator: false,
        backgroundColor: Colors.transparent,
        slides: slides
            .map(
              (e) => e['image']!,
            )
            .toList(),
        height: 90,
        viewportFraction: 0.8,
        childrenStackBuilder: (int index) {
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                width: 32,
                height: 12,
                decoration: BoxDecoration(
                    color: const Color(0xff565249),
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: index,
                    count: 3,
                    effect: const SlideEffect(
                        activeDotColor: Colors.white,
                        dotHeight: 4,
                        dotWidth: 4,
                        spacing: 4),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    slides[index]['subtitle']!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        slides[index]['description']!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_outward_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
