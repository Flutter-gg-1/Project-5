import 'package:flutter/material.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({super.key});

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
      bottomNavigationBar: Text(''),
    );
  }
}
