import 'package:flutter/material.dart';

class ExploreGuestScreen extends StatelessWidget {
  const ExploreGuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff111111),
        body: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: "Enter your username",
                      filled: true,
                      fillColor: const Color(0xff393939),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      hintStyle: const TextStyle(color: Colors.grey)),
                  style: const TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 300,
            ),
            const Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 35,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Search for news",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                )
              ],
            ))
          ],
        ));
  }
}
