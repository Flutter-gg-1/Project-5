import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pro_5/data_handle/git_it/setup.dart';
import 'package:pro_5/data_handle/models/app_model.dart';
import 'package:pro_5/data_handle/models/blog_data_model.dart';
import 'package:pro_5/page/add_blog_page.dart';
import 'package:pro_5/widget/home_page/blog_card_widget.dart';
import 'package:pro_5/widget/home_page/blog_slider_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final List<BlogDataModel> blogList = getIt.get<AppModel>().blogList;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: const Color(0xff111111),
        appBar: AppBar(
          backgroundColor: const Color(0xff1E1E1E),
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {


                  return  const AddBlogPage()   ;
                  
                },)).then((onValue){

                  if(onValue == true){
                    setState(() {
                      
                    });
                  }
                });
              },
              icon: const Icon(
                FontAwesome.plus_solid,
                color: Colors.white,
              ),
            )
          ],
          bottom: TabBar(
            tabAlignment: TabAlignment.center,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: const Color(0xffDD403C),
            unselectedLabelColor: const Color(0xff888888),
            labelColor: Colors.white,
            dividerColor: const Color(0xffFFFFFF).withOpacity(0.1),
            tabs: [
              Tab(
                child: Text(
                  "Tech",
                  style: GoogleFonts.inter(),
                ),
              ),
              Tab(
                child: Text(
                  "AI",
                  style: GoogleFonts.inter(),
                ),
              ),
              Tab(
                child: Text(
                  "Cloud",
                  style: GoogleFonts.inter(),
                ),
              ),
              Tab(
                child: Text(
                  "Robotics",
                  style: GoogleFonts.inter(),
                ),
              ),
              Tab(
                child: Text(
                  "IoT",
                  style: GoogleFonts.inter(),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(child: BlogSliderWidget()),
              const SizedBox(
                height: 10,
              ),
              Divider(
                endIndent: 16,
                indent: 16,
                color: const Color(0xffFFFFFF).withOpacity(0.1),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Top Stories",
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    Text(
                      "See all",
                      style: GoogleFonts.inter(
                          color: const Color(0xff888888),
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ],
                ),
              ),
              // const BlogCardWidget()

            Column(

              children: blogList.map((e) {

                return  BlogCardWidget(blogDataModel: e,);
                
              },).toList(),
            )
            ],
          ),
        ),
      ),
    );
  }
}
