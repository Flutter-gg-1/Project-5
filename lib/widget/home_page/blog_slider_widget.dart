import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BlogSliderWidget extends StatefulWidget {
  const BlogSliderWidget({
    super.key,  
  });
  // final Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  State<BlogSliderWidget> createState() => _BlogSliderWidgetState();
}

class _BlogSliderWidgetState extends State<BlogSliderWidget> {
  int indicatorIndex = 0;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: 180,
      width: 340,
      child: Stack(
        children: [
          CarouselSlider(
            items: [
              Image.asset("asset/img/STK156_Instagram_threads_2 1.png"),
              Image.asset("asset/img/STK156_Instagram_threads_2 1.png"),
              Image.asset("asset/img/STK156_Instagram_threads_2 1.png"),
            ],
            
            options: CarouselOptions(
                height: double.infinity,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  
                  indicatorIndex = index;

                  setState(() {
                    
                  });
                },
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 45,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xff252525)),
                child:  Center(
                  child: AnimatedSmoothIndicator(
                      activeIndex: indicatorIndex,
                      effect: const WormEffect(
                        dotColor: Color(0xff8a8680),
                        activeDotColor: Color(0xffFFFFFF),
                        dotHeight: 6,
                        dotWidth: 6,
                      ),
                      count: 3),
                ),
              ),
            ),
          ),
    
          SizedBox(
            // color: Colors.amber,
            width: double.infinity,
            // height: 20,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16,left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
              
                children: [
              
                  Text("DJI • Jul 10, 2023" ,style: GoogleFonts.inter(color: const Color(0xffB8B8B8),fontSize: 12),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("A month with DJI Mini 3 Pro" ,style: GoogleFonts.inter(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
              
                      const Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(Icons.arrow_outward,color: Colors.white,size: 27,),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
    
    
        ],
      ),
    );
  }
}
