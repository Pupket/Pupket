import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/provider/user_mode_provider.dart';
import 'package:potenday/src/util/custom_basic_container.dart';
import 'package:potenday/src/view/component/bottom_navigation.dart';
import 'package:potenday/src/view/component/take_walk/selectl_take_walk.dart';
import 'package:potenday/src/view/header/app_header.dart';
import 'package:provider/provider.dart';
import 'package:transition/transition.dart';

class WriteTakeWalk extends StatefulWidget {
  const WriteTakeWalk({super.key});

  @override
  State<WriteTakeWalk> createState() => _WriteTakeWalkState();
}

class _WriteTakeWalkState extends State<WriteTakeWalk> {
  final double deviceWidth = GlobalVariables.width;
  final double deviceHeight = GlobalVariables.height;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  late UserModeProvider userModeProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    userModeProvider = Provider.of<UserModeProvider>(context);

    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        backgroundColor: userModeProvider.backgroundColor,
        appBar: AppHeader(isCancel: true, isAlarm: true),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(14, 50, 14, 134),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 22),
                      child: Text(
                        '제목',
                        style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontSize: 16,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomBasicContainer(
                      width: 347,
                      height: 59,
                      color: Color(0xFFFBFBFB),
                      circularBorderRadius: 10,
                    border: Border.all(color: Color(0xFF4B433E)),
                    child: TextField(
                      controller: _titleController,
                      style: const TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 16,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        height: 0.08,
                      ),                  decoration: InputDecoration(
                        hintText: '제목을 입력하세요',
                        hintStyle: const TextStyle(
                          color: Color(0xFF4C433F),
                          fontSize: 15,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.026),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF4C433F), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 67),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 22),
                      child: Text(
                        '픽업 장소',
                        style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontSize: 16,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomBasicContainer(
                    width: 347,
                    height: 59,
                    color: Color(0xFFFBFBFB),
                    circularBorderRadius: 10,
                    border: Border.all(color: Color(0xFF4B433E)),
                    child: TextField(
                      controller: _locationController,
                      style: const TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 16,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        height: 0.08,
                      ),
                      decoration: InputDecoration(
                        hintText: '서울역 3번 출구',
                        hintStyle: const TextStyle(
                          color: Color(0xFF4C433F),
                          fontSize: 15,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.026),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF4C433F), width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    Transition(
                      child: SelectTakeWalk(),
                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                    ),
                  );
                },
                child: const CustomBasicContainer(
                    width: 347,
                    height: 60,
                    color: Color(0xFF4B433E),
                    circularBorderRadius: 60,
                    child: Text(
                      '다음',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
