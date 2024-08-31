import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    hintText: "Enter your password",
                    hintStyle:
                        const TextStyle(color: Color(0xffB8B8B8), fontSize: 14),
                    fillColor: const Color(0x1FFFFFFF),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 300,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_outlined, color: Color(0xffB8B8B8)),
                    Text(
                      "Search for a news",
                      style: TextStyle(color: Color(0xffB8B8B8)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
