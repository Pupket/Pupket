import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:potenday/src/config/global_variables.dart';
import 'package:potenday/src/provider/user_mode_provider.dart';
import 'package:potenday/src/util/custom_basic_container.dart';
import 'package:potenday/src/util/default_next_button.dart';
import 'package:potenday/src/view/header/app_header.dart';
import 'package:provider/provider.dart';

class SingProfile extends StatefulWidget {
  const SingProfile({super.key});

  @override
  State<SingProfile> createState() => _SingProfileState();
}

class _SingProfileState extends State<SingProfile> {
  late UserModeProvider userModeProvider;
  final double deviceWidth = GlobalVariables.width;
  final double deviceHeight = GlobalVariables.height;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();

  bool isMale = false;
  bool isFemale = false;
  String? selectedGender;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumController.dispose();
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
          appBar: AppHeader(isCancel: true, isAlarm: false),
          body: Padding(
            padding: EdgeInsets.fromLTRB(16, 53, 16, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '이름, 닉네임, 성별, 전화번호를 입력하세요',
                      style: TextStyle(
                        color: Color(0xFF4C433F),
                        fontSize: 15,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 36),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '이름',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                CustomBasicContainer(
                  width: 343,
                  height: 48,
                  color: Colors.white,
                  circularBorderRadius: 10,
                  child: TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Color(0xFF4C433F),
                      fontSize: 15,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                      hintText: '이름 입력하기',
                      hintStyle: const TextStyle(
                        color: Color(0x7F4C433F),
                        fontSize: 15,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                      contentPadding: EdgeInsets.all(10),
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
                SizedBox(height: 48),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      '성별',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedGender = 'male';
                        });
                      },
                      child: CustomBasicContainer(
                        width: 160,
                        height: 48,
                        color: Colors.white,
                        border: selectedGender == 'male' ? Border.all(color: const Color(0xFF4C433F), width: 2) : Border.all(color: Colors.transparent),
                        circularBorderRadius: 10,
                        child: Text(
                          '남자',
                          style: TextStyle(
                            color: selectedGender == 'male' ? const Color(0xFF4C433F) : const Color(0x7F4C433F),
                            fontSize: 15,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 23),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedGender = 'female';
                        });
                      },
                      child: CustomBasicContainer(
                        width: 160,
                        height: 48,
                        color: Colors.white,
                        border: selectedGender == 'female' ? Border.all(color: const Color(0xFF4C433F), width: 2) : Border.all(color: Colors.transparent),
                        circularBorderRadius: 10,
                        child: Text(
                          '여자',
                          style: TextStyle(
                            color: selectedGender == 'female' ? const Color(0xFF4C433F) : const Color(0x7F4C433F),
                            fontSize: 15,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 42),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      '전화번호',
                      style: TextStyle(
                        color: Color(0xFF1F1F1F),
                        fontSize: 12,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                CustomBasicContainer(
                  width: 343,
                  height: 48,
                  color: Colors.white,
                  circularBorderRadius: 10,
                  child: TextField(
                    controller: _phoneNumController,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                      color: Color(0xFF4C433F),
                      fontSize: 15,
                      fontFamily: 'NotoSansKR',
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                      hintText: '전화번호',
                      hintStyle: const TextStyle(
                        color: Color(0x7F4C433F),
                        fontSize: 15,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                      contentPadding: EdgeInsets.all(10),
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
                SizedBox(height: 120),
                DefaultNextButton(
                    width: 347,
                    height: 60,
                    title: '가입 완료',
                    onTapCallback: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).pushReplacementNamed('/home');
                    }
                ),
              ],
            ),
          ),
        )
    );
  }
}
