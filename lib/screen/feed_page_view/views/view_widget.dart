import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 1);
              });
            },
            children: const [],
          ),
          Align(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'skip',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
                SmoothPageIndicator(controller: _controller, count: 2),
                onLastPage
                    ? TextButton(
                        onPressed: () {},
                        child: Text(
                          'done',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          "next",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
