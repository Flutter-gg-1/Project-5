import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff111111),
          bottom: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xff111111),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBar(
                  leading: const Icon(Icons.search_outlined,
                      color: Color(0xffB8B8B8)),
                  hintText: "Search for News",
                  hintStyle: WidgetStateProperty.all(
                      const TextStyle(color: Color(0xffB8B8B8), fontSize: 14)),
                  shape: WidgetStateProperty.all(BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 60, 60, 60))),
            ),
          )),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_outlined,
              color: Color(0xffB8B8B8),
              size: 40,
            ),
            Text("Search for News",
                style: TextStyle(color: Color(0xffB8B8B8), fontSize: 20))
          ],
        ),
      ),
    );
  }
}
