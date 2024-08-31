



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_5/page/Home_page.dart';
import 'package:pro_5/page/explore_page.dart';
import 'package:pro_5/page/saved_page.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {


  List<Widget> navWidgetList = [
    const HomePage(),
    const ExplorePage(),
    const SavedPage(),
    const HomePage(),
  ];


  int navIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        backgroundColor: const Color(0xff111111),




      bottomNavigationBar:  BottomNavigationBar(

        currentIndex: navIndex ,
        backgroundColor: const Color(0xff111111).withOpacity(0.84),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xff595959),
        selectedItemColor: Colors.white,

        onTap: (value) {
          
          navIndex = value;
          setState(() {
            
          });
        },


        items: const [

          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Feed"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_outline), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],


      ),



      body:navWidgetList[navIndex] ,




    );
  }
}


