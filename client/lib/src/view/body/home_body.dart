import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:potenday/src/config/color_set.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/config/two_color_background.dart';
import 'package:potenday/src/enum/region.dart';
import 'package:potenday/src/provider/user_mode_provider.dart';
import 'package:potenday/src/util/custom_basic_container.dart';
import 'package:potenday/src/view/component/home/onboarding_steps.dart';
import 'package:potenday/src/view/header/app_header.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final double deviceWidth = GlobalVariables.width;
  final double deviceHeight = GlobalVariables.height;
  final List<String> profileHashtags = ['예민', '까칠', '활발', '귀여움'];
  final List<String> searchHashtags = ['착함', '훈련'];

  late UserModeProvider userModeProvider;

  int? selectedButtonIndex;

  @override
  void initState() {
    super.initState();
  }

  Widget changeMode() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: InkWell(
          onTap: () {
            setState(() {
              userModeProvider.isGuardian = userModeProvider.isGuardian % 2 == 1 ? 2 : 1;
            });
          },
          child: Container(
            width: userModeProvider.isGuardian % 2 == 1 ? 134 : 151,
            height: 36,
            padding: EdgeInsets.fromLTRB(13, 2, 13, 3),
            decoration: ShapeDecoration(
              color: Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userModeProvider.isGuardian % 2 == 1 ? '보호자 모드' : '산책메이트 모드',
                        style: TextStyle(
                          color: Color(0xFF4C433F),
                          fontSize: 12,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w700,
                          height: 1.2, // 기본 줄 간격을 설정합니다.
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userModeProvider.isGuardian % 2 == 1 ? '산책메이트 모드' : '보호자 모드',
                        style: TextStyle(
                          color: Color(0xFF4C433F),
                          fontSize: 10,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          height: 1.2, // 기본 줄 간격을 설정합니다.
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 7),
                Image.asset('assets/images/change_arrow.png', width: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget searchCard() {
    return Container(
      width: 340,
      height: 406,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xFFF3F2F0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 18, 14, 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Image.asset('assets/images/empty_love.png', width: 34)),
            SizedBox(height: 23),
            Container(
              width: deviceWidth * 0.7,
              padding: EdgeInsets.only(left: 9),
              child: Text(
                '순하고 귀여운 저희 집 강아지와 산책하실 분 구합니다',
                style: TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontSize: 20,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 35),
            Container(
              width: 257,
              padding: EdgeInsets.only(left: 9),
              child: Text(
                '2024년 5월 23일 목요일 (산책 시간)\n00초등학교 앞 (픽업 장소)',
                style: TextStyle(
                  color: Color(0xFF818181),
                  fontSize: 13,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 121,
                  height: 121,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Color(0xFF4C433F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/default_profile.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '이름',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 20,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '견종, 나이, 특징 입력값',
                      style: TextStyle(
                        color: Color(0xFF818181),
                        fontSize: 15,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: searchHashtags.map((hashtag) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: CustomBasicContainer(
                            width: 71,
                            height: 29,
                            color: const Color(0xFF4C433F),
                            circularBorderRadius: 12.5,
                            child: Text(
                              '# $hashtag',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget profileCard() {
    return Column(
      children: [
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
          decoration: BoxDecoration(
            color: userModeProvider.isGuardian % 2 == 1 ? Color(0xFF4C433F) : Color(0xFFDAD4CB),
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
                      color: userModeProvider.isGuardian % 2 == 1 ? Colors.white : Color(0xFF4C433F),
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
                  children: profileHashtags.map((hashtag) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: CustomBasicContainer(
                        width: 71,
                        height: 29,
                        color: userModeProvider.isGuardian % 2 == 1 ? Color(0xFFDAD4CB) : Color(0xFF4C433F),
                        circularBorderRadius: 12.5,
                        child: Text(
                          '# $hashtag',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: userModeProvider.isGuardian % 2 == 1 ? Color(0xFF4C433F) : Colors.white,
                            fontSize: 15,
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
      ],
    );
  }

  Widget regionSuggestion() {
    return Column(
      children: [
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
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('MYLOG build HomeBody');
    userModeProvider = Provider.of<UserModeProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: userModeProvider.backgroundColor,
      // body: OnboardingSteps(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(17, 21, 17, 50),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  changeMode(),
                  SizedBox(height: 25),
                  userModeProvider.isGuardian % 2 == 1 ? profileCard() : searchCard(),
                  SizedBox(height: 77),
                  userModeProvider.isGuardian % 2 == 1 ? regionSuggestion() : profileCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}