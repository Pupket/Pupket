import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/provider/bottom_navigation_bar_provider.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});

  final List<Map<String, dynamic>> menuList = <Map<String, dynamic>>[
    {
      'index': 0,
      'route': '/home',
      'image': 'assets/images/nav_btn_home.png',
      'selectedImage': 'assets/images/nav_btn_home_active.png'
    },
    {
      'index': 1,
      'route': '/mate',
      'image': 'assets/images/nav_btn_home.png',
      'selectedImage': 'assets/images/nav_btn_home_active.png'
    },
    {
      'index': 2,
      'route': '/history',
      'image': 'assets/images/nav_btn_home.png',
      'selectedImage': 'assets/images/nav_btn_home_active.png'
    },
    {
      'index': 3,
      'route': '/profile',
      'image': 'assets/images/nav_btn_home.png',
      'selectedImage': 'assets/images/nav_btn_home_active.png'
    },
    {
      'index': 4,
      'route': '/chat',
      'image': 'assets/images/nav_btn_home.png',
      'selectedImage': 'assets/images/nav_btn_home_active.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarProvider bottomNavigationBarProvider =
        Provider.of<BottomNavigationBarProvider>(context);

    final double deviceWidth = GlobalVariables.width;
    final double deviceHeight = GlobalVariables.height;

    return Container(
      width: deviceWidth,
      height: 80,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            spreadRadius: 0.0,
            offset: Offset(-5, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: menuList
            .map(
                (e) => GestureDetector(
                  onTap: () {
                    bottomNavigationBarProvider.currentIndex = e['index'];
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: deviceWidth / 5,
                    child: Center(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          bottomNavigationBarProvider.currentIndex == e['index']
                              ? e['selectedImage']
                              : e['image'],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
        )
          .toList(),
      ),
    );
  }
}
