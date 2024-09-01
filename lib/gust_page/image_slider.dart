import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentImage = 0;
  final List<String> images = [
    'lib/gust_page/images/STK156_Instagram_threads_2 1.png',
    'lib/gust_page/images/STK156_Instagram_threads_2 1.png',
    'lib/gust_page/images/STK156_Instagram_threads_2 1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: 343,
          height: 180,
          child: PageView.builder(
            itemCount: images.length,
            onPageChanged: (int index) {
              setState(() {
                _currentImage = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(images[index], fit: BoxFit.cover);
            },
          ),
        ),
        Positioned(
          top: 30,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(images.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentImage == index ? 10 : 8,
                    height: _currentImage == index ? 10 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentImage == index ? Colors.white : Colors.grey,
                      border: Border.all(color: Colors.grey, width: 1.5),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
