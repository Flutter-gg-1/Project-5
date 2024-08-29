import 'package:flutter/material.dart';

class BottomTabBarView extends StatelessWidget {
  const BottomTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('TabBar'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomTabBarView(),
    );
  }
}
