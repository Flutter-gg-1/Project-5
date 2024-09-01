import 'package:blog_app/data_layer/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:icons_plus/icons_plus.dart';

AppBar customAppBar({final Function()? onPressed}) {
  final locator = GetIt.I.get<UserData>();
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.white),
    leading: const Icon(
      MingCute.menu_line,
    ),
    actions: [
      const Icon(
        Iconsax.search_normal_1_outline,
      ),
      const SizedBox(
        width: 16,
      ),
     locator.isGust==true ? IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.add_outline),
      ):const Text(''),
      const SizedBox(
        width: 6.5,
      ),
    ],
    bottom: const TabBar(
        labelStyle: TextStyle(color: Colors.white),
        indicatorColor: Color(0xffDD403C),
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        tabs: [
          SizedBox(
            width: 60,
            height: 40,
            child: Center(
              child: Text(
                'Tech',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: Center(
              child: Text(
                'AI',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Text(
            'Cloud',
            style: TextStyle(
                fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            'Robotics',
            style: TextStyle(
                fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            'IoT',
            style: TextStyle(
                fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ]),
  );
}
