import 'package:flutter/material.dart';
import 'package:potenday/src/config/color_set.dart';
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
      'name': '홈'
    },
    {
      'index': 1,
      'route': '/take_walk',
      'image': 'assets/images/nav_btn_take_walk.png',
      'selectedImage': 'assets/images/nav_btn_take_walk_active.png',
      'name': '산책하기'
    },
    {
      'index': 2,
      'route': '/my_walk',
      'image': 'assets/images/nav_btn_my_walk.png',
      'name': '내산책'
    },
    {
      'index': 3,
      'route': '/profile',
      'image': 'assets/images/nav_btn_profile.png',
      'name': '프로필'
    },
    {
      'index': 4,
      'route': '/my_page',
      'image': 'assets/images/nav_btn_my_page.png',
      'name': '마이페이지'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarProvider bottomNavigationBarProvider =
        Provider.of<BottomNavigationBarProvider>(context);

    final double deviceWidth = GlobalVariables.width;
    final double deviceHeight = GlobalVariables.height;

    return Container(
      color: CustomColor.lightBackgroundColor,
      child: Container(
        width: deviceWidth,
        height: 83,
        color: const Color(0x19000000),
        // decoration: const BoxDecoration(
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(120),
        //     topRight: Radius.circular(120),
        //   ),
        //   color: Color(0xFFF6F6F6),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey,
        //       blurRadius: 10.0,
        //       spreadRadius: 0.0,
        //       offset: Offset(-5, -1),
        //     ),
        //   ],
        // ),
        child: Center(
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(flex: 1),
                ...menuList.map((e) {
                  return GestureDetector(
                    onTap: () {
                      bottomNavigationBarProvider.currentIndex = e['index'];
                      Navigator.pushNamed(context, e['route']);
                    },
                    child: SizedBox(
                      width: (deviceWidth - 80) / 4,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 4),
                          width: 58,
                          height: 58,
                          decoration: bottomNavigationBarProvider.currentIndex == e['index']
                              ? BoxDecoration(
                            color: Colors.black.withOpacity(0.2), // 반투명한 검정색
                            borderRadius: BorderRadius.circular(8.0),
                          )
                              : null,
                          child: Column(
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: Image.asset(
                                  e['image'],
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text(
                                e['name'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF4C433F),
                                  fontSize: 12,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w500,
                                  height: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
