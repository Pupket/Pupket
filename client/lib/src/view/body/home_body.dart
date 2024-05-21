import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:potenday/src/config/color_set.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/config/two_color_background.dart';
import 'package:potenday/src/enum/region.dart';
import 'package:potenday/src/util/custom_basic_container.dart';
import 'package:potenday/src/view/component/home/onboarding_steps.dart';
import 'package:potenday/src/view/header/app_header.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final double deviceWidth = GlobalVariables.width;
  final double deviceHeight = GlobalVariables.height;
  final List<String> hashtags = ['예민', '까칠', '활발', '귀여움'];

  int? selectedButtonIndex;

  @override
  Widget build(BuildContext context) {
    debugPrint('MYLOG build HomeBody');



    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      // body: OnboardingSteps(),
      body: Stack(
        children: [
          CustomPaint(
            size: Size(deviceWidth, deviceHeight),
            painter: TwoColorBackground(),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(17, 19, 17, 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/light_screen_text_logo.png', width: 84),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Image.asset('assets/images/light_screen_dog.png', width: 32),
                      SizedBox(width: 17),
                      const Column(
                        children: [
                          Text(
                            '보호자 모드',
                            style: TextStyle(
                              color: Color(0xFF4C433F),
                              fontSize: 15,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          Text(
                            '산책메이트 모드',
                            style: TextStyle(
                              color: Color(0xFF4C433F),
                              fontSize: 10,
                              fontFamily: 'Noto Sans KR',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Stack(
                    children: [
                      Container(
                        width: 342,
                        height: 305,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Image.asset(
                            'assets/images/test_img.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 14,
                        left: 20,
                        child: Column(
                          children: [
                            Text.rich(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w700,
                                height: 1.5,
                                shadows: [
                                  Shadow( // 상단 검은색 그림자
                                    offset: Offset(0, -1),
                                    blurRadius: 3,
                                    color: Colors.black,
                                  ),
                                  Shadow( // 하단 검은색 그림자
                                    offset: Offset(0, 1),
                                    blurRadius: 3,
                                    color: Colors.black,
                                  ),
                                  Shadow( // 좌측 검은색 그림자
                                    offset: Offset(-1, 0),
                                    blurRadius: 3,
                                    color: Colors.black,
                                  ),
                                  Shadow( // 우측 검은색 그림자
                                    offset: Offset(1, 0),
                                    blurRadius: 3,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '@ 바보개\n',
                                  ),
                                  TextSpan(
                                    text: '나이, 성별',
                                    style: TextStyle(
                                      fontSize: 15,
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 342,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xFF4C433F),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '선호지역 | 선호요일 | 선호시간',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: hashtags.map((hashtag) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: CustomBasicContainer(
                                    width: 71,
                                    height: 29,
                                    color: const Color(0xFFDAD4CB),
                                    circularBorderRadius: 12.5,
                                  child: Text(
                                    '# $hashtag',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      color: Color(0xFF4C433F),
                                      fontSize: 12,
                                      fontFamily: 'NotoSansKR',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 77),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '지역별 추천',
                      style: TextStyle(
                        color: Color(0xFF4C433F),
                        fontSize: 15,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 열 개수
                      crossAxisSpacing: 11, // 열 간 간격
                      mainAxisSpacing: 14, // 행 간 간격
                      childAspectRatio: 16.4/7.1, // 가로:세로 비율
                    ),
                    itemCount: Region.values.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final region = Region.values[index];
                      return InkWell(
                        onTap: () {
                          // 버튼 클릭 시 실행할 코드
                          setState(() {
                            selectedButtonIndex = index;
                          });
                          debugPrint('${region.koreanName} 버튼이 클릭됨');
                        },
                        child: CustomBasicContainer(
                          width: 0,
                          height: 0,
                          color: selectedButtonIndex == index ? Color(0xFF4C433F) : Color(0xFFF9F9F9),
                          border: Border.all(color: selectedButtonIndex == index ? Colors.white : Colors.transparent, width: 1),
                          circularBorderRadius: 10,
                          child: Center(
                            child: Text(
                              region.koreanName,
                              style: TextStyle(
                                color: selectedButtonIndex == index ? Colors.white : Color(0xFF4C433F),
                                fontSize: 15,
                                fontFamily: "NotoSansKR",
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}