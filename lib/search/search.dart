import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff111111),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Color(0xff2e2e2e),
                filled: true,
                hintText: 'Search for News',
                hintStyle: TextStyle(color: Color(0xffb0b0b0)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xffb0b0b0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 250,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                color: Color(0xffFFFFFF),
                size: 40,
              ),
              SizedBox(
                width: 13,
              ),
              Text(
                'Search for a news',
                style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF)),
              )
            ],
          )
        ],
      ),
    );
  }
}
