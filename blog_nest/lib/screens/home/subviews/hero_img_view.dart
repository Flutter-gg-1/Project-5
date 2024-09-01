import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import '../../../extensions/color_ext.dart';
import '../../../model/blog.dart';
import '../../../utils/img_converter.dart';
import '../../../utils/typedefs.dart';

class HeroImgView extends StatefulWidget {
  const HeroImgView({required this.blogs, super.key});
  final List<Blog> blogs;

  @override
  State<HeroImgView> createState() => _MyHeroImgViewState();
}

class _MyHeroImgViewState extends State<HeroImgView> {
  final PageController _pageController = PageController(initialPage: 0);

  int selectedPage = 0;

  void _changePage(int value) {
    selectedPage = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
        controller: _pageController,
        onPageChanged: (value) => _changePage(value),
        children: widget.blogs
            .map(
              (blog) => ClipRRect(
                  borderRadius: BR.circular(16),
                  child: ImgConverter.imageFromBase64String(blog.imgData)),
            )
            .toList(),
      ),
      Align(
        alignment: AL.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BR.circular(8),
            child: Container(
              width: widget.blogs.length * 22,
              decoration: const BoxDecoration(
                  color: C.itemBg, shape: BoxShape.rectangle),
              child: PageViewDotIndicator(
                alignment: AL.topCenter,
                padding: const EI.all(2),
                currentItem: selectedPage,
                count: widget.blogs.length,
                unselectedColor: C.text3,
                selectedColor: C.text1,
                duration: const Duration(milliseconds: 200),
                boxShape: BoxShape.circle,
                onItemClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
